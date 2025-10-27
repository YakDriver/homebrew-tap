# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '1.22.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.22.0/consul_1.22.0_darwin_amd64.zip'
    sha256 'eb949ef495d53c1a08d9564105e742ed9eb93ef4f05abafaa4c479b3895bb4b8'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/1.22.0/consul_1.22.0_darwin_arm64.zip'
    sha256 '6d9d58a2364d2ac23c816d6eb463ffcd10c568c547268fad310dc4299ac483e5'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.22.0/consul_1.22.0_linux_amd64.zip'
    sha256 '9891495a2defabc3d637b376c66550e9879102868fbe6456a9a683067ae20ae9'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.22.0/consul_1.22.0_linux_arm.zip'
    sha256 'f57b7e2fd5e28ff451ebb626cc17bcf707124ee5096f80abdb2cb44dd9db3eb5'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.22.0/consul_1.22.0_linux_arm64.zip'
    sha256 '9481aec98bd198d919332e1bed75a62825a9b44cc341b1d56bbfbfb81c5a14c9'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
