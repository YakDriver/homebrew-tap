require 'net/http'
require 'json'
require 'digest'

# To run: ruby updateformulae.rb

# Define the repository and formula file
repo = "YakDriver/tfproviderdocs"
formula_file = "Formula/tfproviderdocs.rb"

# Fetch the latest release information from GitHub API
uri = URI("https://api.github.com/repos/#{repo}/releases/latest")
response = Net::HTTP.get(uri)
release = JSON.parse(response)
version = release["tag_name"]

# Define the URLs for each platform
urls = {
  "darwin_amd64" => "https://github.com/#{repo}/releases/download/#{version}/tfproviderdocs_#{version}_darwin_amd64.tar.gz",
  "darwin_arm64" => "https://github.com/#{repo}/releases/download/#{version}/tfproviderdocs_#{version}_darwin_arm64.tar.gz",
  "linux_amd64" => "https://github.com/#{repo}/releases/download/#{version}/tfproviderdocs_#{version}_linux_amd64.tar.gz",
  "linux_arm64" => "https://github.com/#{repo}/releases/download/#{version}/tfproviderdocs_#{version}_linux_arm64.tar.gz"
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

# Update the sha256 hashes in the formula file
sha256s.each do |platform, sha256|
  formula.gsub!(/sha256 "[a-f0-9]{64}"\n\s*url "#{urls[platform]}"/, "sha256 \"#{sha256}\"\n        url \"#{urls[platform]}\"")
end

# Write the updated formula back to the file
File.write(formula_file, formula)

puts "Updated #{formula_file} with new sha256 hashes for version #{version}"
