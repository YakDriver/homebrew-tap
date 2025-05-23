# frozen_string_literal: true

# Consul is a tool for service discovery, monitoring, and configuration.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul CLI tool.
class Consul < Formula
  desc 'Consul'
  homepage 'https://www.consul.io/'
  version '1.21.1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.21.1/consul_1.21.1_darwin_amd64.zip'
    sha256 '4f9b7b55f268d792c70f47843a2598664bf55765d81c6224d4f5441eb6d54c0c'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul/1.21.1/consul_1.21.1_darwin_arm64.zip'
    sha256 '67b32dc6902f37037d8fb6a17c48bc454b1724fc2318ea0b8336578d5bd63cf5'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul/1.21.1/consul_1.21.1_linux_amd64.zip'
    sha256 'cf5b8d429c67d4e3c86e2f52eb3245ee00119a9a389f2af36a77b16b1e1eb27c'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.21.1/consul_1.21.1_linux_arm.zip'
    sha256 '0098a00c18e1aee3c436b2f67f7e82a0103a8e6702595d5e088bcf9f5b6ff275'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul/1.21.1/consul_1.21.1_linux_arm64.zip'
    sha256 '4f9faad99f0888eac6c127e50385af28b2b06e67d0f7c84662a66bf1079c0da5'
  end

  conflicts_with 'consul'

  def install
    bin.install 'consul'
  end

  test do
    system "#{bin}/consul --version"
  end
end
