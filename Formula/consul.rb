# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '1.22.4'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.22.4/consul_1.22.4_darwin_amd64.zip'
    sha256 '2443229fd5146361f8f95b8ab0901d0105d482128d848964c95fc441b2688d41'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/1.22.4/consul_1.22.4_darwin_arm64.zip'
    sha256 'b14c637e1e83b822942c9ce7922efbad8fb5fe0cea55022abe31bf64e2f56383'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.22.4/consul_1.22.4_linux_amd64.zip'
    sha256 '34c6376d40752118e4a09564c18191da6226f8c38019f0cf4cc7d963d75c6d9c'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.22.4/consul_1.22.4_linux_arm.zip'
    sha256 '841d6c78400d1fb5c1b021058131852de7b50b89acf6219d5ec850136df6814a'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.22.4/consul_1.22.4_linux_arm64.zip'
    sha256 '34f32e1d751575264554010f970a178e503baccd391c206c9e91d08247c71610'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
