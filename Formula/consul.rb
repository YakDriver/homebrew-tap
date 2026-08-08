# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '2.0.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/2.0.3/consul_2.0.3_darwin_amd64.zip'
    sha256 '9a8ced39610be73c4b6c918e64c1589a3fe9747f3a2188b8da55d0a35ddca4e0'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/2.0.3/consul_2.0.3_darwin_arm64.zip'
    sha256 'fed05e8e2a296989c1a5c86e3b38d5f4dbdc7d83e0c0acf4c5fe7e302e8f4fde'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/2.0.3/consul_2.0.3_linux_amd64.zip'
    sha256 '3020eea3fdfd939eb021ecaca105a1513af52b22e76f2ee97ea85acc6ff2f832'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/2.0.3/consul_2.0.3_linux_arm.zip'
    sha256 '4c083e3e4b5285d264117dfdc8d831656add844281638440c28860b42f515d13'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/2.0.3/consul_2.0.3_linux_arm64.zip'
    sha256 '7551d8f07cbfb633d260fe27a9f7144ce08f1cb964e31e15788309dfb6c2fda5'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
