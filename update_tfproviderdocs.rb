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

# Download a file and return its SHA256 hash
def download_and_hash(url)
  uri = URI(url)
  Tempfile.create do |file|
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request_get(uri.request_uri) do |resp|
        resp.read_body { |chunk| file.write(chunk) }
      end
    end
    file.rewind
    Digest::SHA256.hexdigest(file.read)
  end
end

# Get the latest release info from GitHub
resp = Net::HTTP.get(URI(GITHUB_API_RELEASES))
release = JSON.parse(resp)
tag_name = release['tag_name']
if tag_name.nil?
  puts "Error: No tag_name found in GitHub API response. Response was:"
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
