# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '1.21.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.21.3/consul_1.21.3_darwin_amd64.zip'
    sha256 '124df50ef2bbeafc33dfe428f67aef26af3ef7f4aa509ff1c98a117a91dd0b59'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/1.21.3/consul_1.21.3_darwin_arm64.zip'
    sha256 'e9d94d3859f0d9a795992433e7c203b06bf0994c54dee7feaff1d1c46a75fd9f'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.21.3/consul_1.21.3_linux_amd64.zip'
    sha256 'ba20631037a5f63f70b0351c0875887a66c0a0d3feac2d255a768c9eb8c95e8b'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.21.3/consul_1.21.3_linux_arm.zip'
    sha256 'd3fe8f192ddc0a466651045bb8e49ffadde68be906453be85e54e85de5f6eada'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.21.3/consul_1.21.3_linux_arm64.zip'
    sha256 'e5d3572e6196a8c875d5e4ab094a7ab2abecf562d6703f2675cb9cf819cfebb2'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
