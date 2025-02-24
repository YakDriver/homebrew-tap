# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '1.20.4'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.20.4/consul_1.20.4_darwin_amd64.zip'
    sha256 '4130fe72c4e07c18fd426781145949743f6372a83299bf37d0a77b7680429352'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/1.20.4/consul_1.20.4_darwin_arm64.zip'
    sha256 '6eb464db4fb7593722706340a4815fc86ba797b999c4a98c6b78e29c1078f3cd'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.20.4/consul_1.20.4_linux_amd64.zip'
    sha256 'dc8ef4b721928f5ceb29689c4811b43bf776a1f43845a0bb1c851e313cb845b2'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.20.4/consul_1.20.4_linux_arm.zip'
    sha256 '1c306757a85462cc5b4a4a0895c14d7185c2a57c7b30dc978ab427aee38de429'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.20.4/consul_1.20.4_linux_arm64.zip'
    sha256 'f0eecc635443f291c8e24547ce17aeb8ab661dff7051d4fffa455c99cb17f027'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
