# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '1.21.2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.21.2/consul_1.21.2_darwin_amd64.zip'
    sha256 '917754ed822912f5fe7724055a79cccd16ad6d0553438c854fb18ccbe8bb9625'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/1.21.2/consul_1.21.2_darwin_arm64.zip'
    sha256 'fea0f3f9bb096adcdcb1292da3e4d93996e1c0711be3b2261b6b877bd15b1037'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.21.2/consul_1.21.2_linux_amd64.zip'
    sha256 '07a738cc8f7937f28d1418e8f289b28445e82d5cbd0aabdbcf2b5a0cacf26a29'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.21.2/consul_1.21.2_linux_arm.zip'
    sha256 '7e9271e989b08b8a6aaf0d7ea4485e325fb2bbae62fafa4e1989953637634025'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.21.2/consul_1.21.2_linux_arm64.zip'
    sha256 'fb53ea04f7deb97919417edda938b7f70f967840f2060158a157e9b130ce725e'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
