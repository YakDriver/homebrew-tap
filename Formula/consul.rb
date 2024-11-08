# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '1.20.1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.20.1/consul_1.20.1_darwin_amd64.zip'
    sha256 'b7a55924006a085e8e4e3a19520d44593799175704b225df443a33448c7e9d0b'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/1.20.1/consul_1.20.1_darwin_arm64.zip'
    sha256 '17c138c3b0ad841b2644702720c7235f975793606d01757c821a2ac138cb2321'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.20.1/consul_1.20.1_linux_amd64.zip'
    sha256 'd38e7571177909d437a9cbcc62fb65083bc567266b74a62d02c6abe783951648'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.20.1/consul_1.20.1_linux_arm.zip'
    sha256 'b55e5d03f93efb16e79c63c0ad4b8a10e350ee9ddfedbb88fdeb00b818a8df74'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.20.1/consul_1.20.1_linux_arm64.zip'
    sha256 '03ad4cf513819413016a79154e74161bcfa3c9e1fbfcbdc9eca525b2123d4779'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
