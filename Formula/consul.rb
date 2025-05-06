# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '1.21.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.21.0/consul_1.21.0_darwin_amd64.zip'
    sha256 'f8094a72e983503e55b30fe805f2d47fa37f05dd201bfaa782ddf5a8adef7720'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/1.21.0/consul_1.21.0_darwin_arm64.zip'
    sha256 '1f37d1e98131af0b6b3042c8e484473843704efa8815959e745ac50b81b905a9'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.21.0/consul_1.21.0_linux_amd64.zip'
    sha256 'e916e30904eedfa7ee2e2a378b5e8a9a374f2f351e645aa4c0a03adc15dabaec'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.21.0/consul_1.21.0_linux_arm.zip'
    sha256 '10c0076af30bf1fc39f04ae2cf470fa04b5e55a4d956fc696b7694e7cbb56fb2'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.21.0/consul_1.21.0_linux_arm64.zip'
    sha256 '59d04f948d4b04a1d836e69a441e4c3ffb74b41f710329c9ba0dc99392b6f2d5'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
