# frozen_string_literal: true

require 'net/http'
require 'json'
require 'digest'
require 'nokogiri'
require 'rubygems' # Required for Gem::Version

# Define the HashiCorp releases server URL
RELEASES_URL = 'https://releases.hashicorp.com'

# Function to download a file and calculate its sha256 hash
def download_and_hash(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  Digest::SHA256.hexdigest(response)
end

def latest_version(prod_id, ver_re)
  # Fetch the latest version
  uri = URI("#{RELEASES_URL}/#{prod_id}/")
  response = Net::HTTP.get(uri)
  page = Nokogiri::HTML(response)

  # Extract and print all versions
  versions = page.css('a').map(&:text).grep(/^#{prod_id}_#{ver_re}$/)

  # Print each version found
  puts 'Found versions:'
  versions.each do |version|
    puts version
  end

  # Find the latest version using Gem::Version for correct comparison
  versions.map { |v| v.match(/#{prod_id}_#{ver_re}$/)[1] }.max_by { |v| Gem::Version.new(v) }
end

def bin_urls(prod_id, latest)
  {
    'darwin_amd64' => "#{RELEASES_URL}/#{prod_id}/#{latest}/#{prod_id}_#{latest}_darwin_amd64.zip",
    'darwin_arm64' => "#{RELEASES_URL}/#{prod_id}/#{latest}/#{prod_id}_#{latest}_darwin_arm64.zip",
    'linux_amd64' => "#{RELEASES_URL}/#{prod_id}/#{latest}/#{prod_id}_#{latest}_linux_amd64.zip",
    'linux_arm' => "#{RELEASES_URL}/#{prod_id}/#{latest}/#{prod_id}_#{latest}_linux_arm.zip",
    'linux_arm64' => "#{RELEASES_URL}/#{prod_id}/#{latest}/#{prod_id}_#{latest}_linux_arm64.zip"
  }
end

def shas(urls)
  shas = {}
  urls.each do |platform, url|
    shas[platform] = download_and_hash(url)
  end
  shas
end

def formula_url_replacements(formula, urls, sha256s, prod_id, ver_re)
  urls.each do |platform, url|
    formula.gsub!(
      %r{url '#{RELEASES_URL}/#{prod_id}/#{ver_re}/#{prod_id}_#{ver_re}_#{platform}.zip'\n    sha256 '[a-f0-9]{64}'},
      "url '#{url}'\n    sha256 '#{sha256s[platform]}'"
    )
  end

  formula
end

def write_formula_file(prod_id, formula_file, ver_re, latest)
  urls = bin_urls(prod_id, latest)
  sha256s = shas(urls)

  formula = File.read("Formula/#{formula_file}")
  formula.gsub!(/version '#{ver_re}'/, "version '#{latest}'")
  formula_url_replacements(formula, urls, sha256s, prod_id, ver_re)
  File.write("Formula/#{formula_file}", formula)

  File.open('update_summary.txt', 'a') do |f|
    f.puts "#{formula_file}: #{latest}\n"
  end
end

def update_formula(prod_id, formula_file, ver_re, _version_file)
  # Find the latest version using Gem::Version for correct comparison
  latest = latest_version(prod_id, ver_re)

  # Check if latest is empty and quit if it is
  if latest.nil? || latest.empty?
    puts 'No version found. Exiting.'
    exit 1
  end

  write_formula_file(prod_id, formula_file, ver_re, latest)
  puts "Updated #{formula_file} with new version #{latest} and sha256 hashes"
end

File.write('update_summary.txt', '')

# Call the function for each formula file
update_formula('boundary', 'boundary.rb', '(\d+\.\d+\.\d+)', 'boundary.txt')
update_formula('consul-aws', 'consul_aws.rb', '(\d+\.\d+\.\d+)', 'consul_aws.txt')
update_formula('consul', 'consul.rb', '(\d+\.\d+\.\d+)', 'consul.txt')
update_formula('nomad', 'nomad.rb', '(\d+\.\d+\.\d+)', 'nomad.txt')
update_formula('packer', 'packer_alpha.rb', '(\d+\.\d+\.\d+-alpha\d*)', 'packer_alpha.txt')
update_formula('packer', 'packer_beta.rb', '(\d+\.\d+\.\d+-beta\d*)', 'packer_beta.txt')
update_formula('packer', 'packer.rb', '(\d+\.\d+\.\d+)', 'packer.txt')
update_formula('sentinel', 'sentinel.rb', '(\d+\.\d+\.\d+)', 'sentinel.txt')
update_formula('terraform', 'terraform_alpha.rb', '(\d+\.\d+\.\d+-alpha\d+)', 'terraform_alpha.txt')
update_formula('terraform', 'terraform_beta.rb', '(\d+\.\d+\.\d+-beta\d+)', 'terraform_beta.txt')
update_formula('terraform', 'terraform.rb', '(\d+\.\d+\.\d+)', 'terraform.txt')
update_formula('tf-migrate', 'tf_migrate_alpha.rb', '(\d+\.\d+\.\d+-alpha\d*)', 'tf_migrate_alpha.txt')
update_formula('tf-migrate', 'tf_migrate_beta.rb', '(\d+\.\d+\.\d+-beta\d*)', 'tf_migrate_beta.txt')
update_formula('tfstacks', 'tfstacks.rb', '(\d+\.\d+\.\d+)', 'tfstacks.txt')
update_formula('vault', 'vault.rb', '(\d+\.\d+\.\d+)', 'vault.txt')
update_formula('waypoint', 'waypoint.rb', '(\d+\.\d+\.\d+)', 'waypoint.txt')
