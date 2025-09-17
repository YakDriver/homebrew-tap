# frozen_string_literal: true

require 'net/http'
require 'json'
require 'digest'
require 'uri'
require 'tempfile'

GITHUB_API_RELEASES = 'https://api.github.com/repos/YakDriver/tfproviderdocs/releases/latest'
GITHUB_RELEASES_BASE = 'https://github.com/YakDriver/tfproviderdocs/releases/download'
FORMULA_PATH = 'Formula/tfproviderdocs.rb'
README_PATH = 'README.md'
SUMMARY_PATH = 'update_summary.txt'

# Download a file with redirect support and return its SHA256 hash
def download_and_hash(url, max_redirects = 10)
  content = download_with_redirects(url, max_redirects)
  Digest::SHA256.hexdigest(content)
end

# Download content following redirects
def download_with_redirects(url, max_redirects = 10)
  uri = URI(url)
  
  Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
    response = http.request_get(uri.request_uri)
    
    case response
    when Net::HTTPRedirection
      if max_redirects > 0
        new_url = response['Location']
        return download_with_redirects(new_url, max_redirects - 1)
      else
        raise 'Too many redirects'
      end
    when Net::HTTPSuccess
      return response.body
    else
      raise "HTTP Error: #{response.code} #{response.message}"
    end
  end
end

# Get the latest release info from GitHub
max_attempts = 3
attempt = 0
tag_name = nil
release = nil
while attempt < max_attempts && tag_name.nil?
  resp = Net::HTTP.get(URI(GITHUB_API_RELEASES))
  release = begin
    JSON.parse(resp)
  rescue StandardError
    {}
  end
  tag_name = release['tag_name']
  attempt += 1
  sleep 2 if tag_name.nil? && attempt < max_attempts
end
if tag_name.nil?
  puts "Error: No tag_name found in GitHub API response after #{max_attempts} attempts. Response was:"
  puts release
  exit 1
end
version = tag_name.gsub(/^v/, '')
assets = release['assets']

# Map platform to asset info
platforms = {
  'darwin_amd64' => /darwin_amd64\.tar\.gz$/,
  'darwin_arm64' => /darwin_arm64\.tar\.gz$/,
  'linux_amd64' => /linux_amd64\.tar\.gz$/,
  'linux_arm64' => /linux_arm64\.tar\.gz$/
}

urls = {}
sha256s = {}
platforms.each do |platform, regex|
  asset = assets.find { |a| a['name'] =~ regex }
  next unless asset

  url = asset['browser_download_url']
  urls[platform] = url
  sha256s[platform] = download_and_hash(url)
end

# Read and update the formula file
formula = File.read(FORMULA_PATH)
formula.gsub!(/version '\d+\.\d+\.\d+'/, "version '#{version}'")

platforms.each_key do |platform|
  url = urls[platform]
  sha = sha256s[platform]
  next unless url && sha

  url_regex = /url '.*#{platform}.*'\n\s*sha256 '[a-f0-9]{64}'/
  formula.gsub!(url_regex, "url '#{url}'\n      sha256 '#{sha}'")
end

File.write(FORMULA_PATH, formula)

# Update README.md
if File.exist?(README_PATH)
  readme = File.read(README_PATH)
  readme.gsub!(/\| tfproviderdocs \| \d+\.\d+\.\d+ \|/, "| tfproviderdocs | #{version} |")
  File.write(README_PATH, readme)
end

# Append to update_summary.txt
File.open(SUMMARY_PATH, 'a') do |f|
  f.puts "tfproviderdocs: #{version}"
end

puts "Updated tfproviderdocs to version #{version}"
