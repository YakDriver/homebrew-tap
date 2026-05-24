# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '2.0.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/2.0.0/consul_2.0.0_darwin_amd64.zip'
    sha256 'd91f0f02e62b2697038ae399a78ba17a14a8657e7d8ac82d11dcf17b40b620ea'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/2.0.0/consul_2.0.0_darwin_arm64.zip'
    sha256 '846f2adcb2a931a5114ef240fb95e35ebdcf907191fa421d01fc47b38f0a40b2'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/2.0.0/consul_2.0.0_linux_amd64.zip'
    sha256 '25fe76d3203529af59834cff4a29a128050b630d62901be7ad850b9991ddf991'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/2.0.0/consul_2.0.0_linux_arm.zip'
    sha256 '1ebe253ac59cf2dd239245b562702f3fc8fd884d19a31ef9496891878611ee73'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/2.0.0/consul_2.0.0_linux_arm64.zip'
    sha256 'caea9d634b18ef137b0e62adac5dd14407cd942092c2c6281b70edd90b86d5e2'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
