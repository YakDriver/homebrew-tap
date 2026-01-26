# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '1.22.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.22.3/consul_1.22.3_darwin_amd64.zip'
    sha256 'e4663e1ac1b6171d7f9439121009c930068c2499cfba12e3fcb2e28fdac07b41'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/1.22.3/consul_1.22.3_darwin_arm64.zip'
    sha256 'b2881e2f9c6704fdac53d54dfb3957bf0d280600541a8e8f61d807e96ea7efa0'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.22.3/consul_1.22.3_linux_amd64.zip'
    sha256 '0942ef6ed43522adfb4cddbefea2f0e64306318afb8aeab3727563f0caef04be'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.22.3/consul_1.22.3_linux_arm.zip'
    sha256 'a554467b665773ebf6d1bd25b9c3ad43ef0042c2dfabe1b524c86d0af2e77935'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.22.3/consul_1.22.3_linux_arm64.zip'
    sha256 'ee6f8bee5290c98ad64be28e5a8865a1a299f62b4edd19e8428e3cde9ad58ffa'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
