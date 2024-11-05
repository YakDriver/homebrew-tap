require 'net/http'
require 'json'
require 'digest'
require 'nokogiri'
require 'rubygems' # Required for Gem::Version

# Define the formula file
formula_file = "Formula/terraform-latest-alpha.rb"

# Fetch the latest alpha version information from HashiCorp releases page
uri = URI("https://releases.hashicorp.com/terraform/")
response = Net::HTTP.get(uri)
page = Nokogiri::HTML(response)

# Extract and print all alpha versions
alpha_versions = page.css('a').map { |link| link.text }.grep(/^terraform_\d+\.\d+\.\d+-alpha\d+$/)

# Print each alpha version found
puts "Found alpha versions:"
alpha_versions.each do |version|
  puts version
end

# Find the latest alpha version using Gem::Version for correct comparison
latest_alpha_version = alpha_versions.map { |v| v.match(/terraform_(\d+\.\d+\.\d+-alpha\d+)$/)[1] }.max_by { |v| Gem::Version.new(v) }

# Check if latest_alpha_version is empty and quit if it is
if latest_alpha_version.nil? || latest_alpha_version.empty?
  puts "No alpha version found. Exiting."
  exit 1
end

# Write the latest alpha version to a file
File.write('terraform_latest_alpha_version.txt', latest_alpha_version)

# Define the URLs for each platform
urls = {
  "darwin_amd64" => "https://releases.hashicorp.com/terraform/#{latest_alpha_version}/terraform_#{latest_alpha_version}_darwin_amd64.zip",
  "darwin_arm64" => "https://releases.hashicorp.com/terraform/#{latest_alpha_version}/terraform_#{latest_alpha_version}_darwin_arm64.zip",
  "linux_amd64" => "https://releases.hashicorp.com/terraform/#{latest_alpha_version}/terraform_#{latest_alpha_version}_linux_amd64.zip",
  "linux_arm" => "https://releases.hashicorp.com/terraform/#{latest_alpha_version}/terraform_#{latest_alpha_version}_linux_arm.zip",
  "linux_arm64" => "https://releases.hashicorp.com/terraform/#{latest_alpha_version}/terraform_#{latest_alpha_version}_linux_arm64.zip"
}

# Function to download a file and calculate its sha256 hash
def download_and_hash(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  Digest::SHA256.hexdigest(response)
end

# Calculate the sha256 hashes for each platform
sha256s = {}
urls.each do |platform, url|
  sha256s[platform] = download_and_hash(url)
end

# Read the formula file
formula = File.read(formula_file)

# Update the version number in the formula file
formula.gsub!(/version "\d+\.\d+\.\d+-alpha\d+"/, "version \"#{latest_alpha_version}\"")

# Update the URLs and SHA256 hashes in the formula file
urls.each do |platform, url|
  formula.gsub!(/url "https:\/\/releases.hashicorp.com\/terraform\/\d+\.\d+\.\d+-alpha\d+\/terraform_\d+\.\d+\.\d+-alpha\d+_#{platform}.zip"\n    sha256 "[a-f0-9]{64}"/, "url \"#{url}\"\n    sha256 \"#{sha256s[platform]}\"")
end

# Write the updated formula back to the file
File.write(formula_file, formula)

puts "Updated #{formula_file} with new version #{latest_alpha_version} and sha256 hashes"
