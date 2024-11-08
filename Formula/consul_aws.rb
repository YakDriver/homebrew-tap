# frozen_string_literal: true

# Consul AWS is a tool for service discovery, monitoring, and configuration in AWS environments.
# It provides a secure way to connect and configure services across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Consul AWS CLI tool.
class ConsulAws < Formula
  desc 'Consul AWS'
  homepage 'https://github.com/hashicorp/consul-aws'
  version '0.1.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul-aws/0.1.3/consul-aws_0.1.3_darwin_amd64.zip'
    sha256 '41c57011b30233ae972428f2e57f11ee656138b116982bbcb6bf5a3e138e7510'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/consul-aws/0.1.3/consul-aws_0.1.3_darwin_arm64.zip'
    sha256 '5d141a27cd7b0e0fa8b03bdad02fa4486d9c68d17e1a7b9188aae14d76af8001'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/consul-aws/0.1.3/consul-aws_0.1.3_linux_amd64.zip'
    sha256 '041d14c0219b13f109745bc97818fd235afde2badff6264d9132438d0a03fdf0'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul-aws/0.1.3/consul-aws_0.1.3_linux_arm.zip'
    sha256 '851441d6404c4751e52539b9d61b666a4ee5b0a3cac3abd44e7f5a060ee0ec71'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/consul-aws/0.1.3/consul-aws_0.1.3_linux_arm64.zip'
    sha256 'a6a2c3e9e480da2c57da7cfbfc7bfadfcc8a2df654fc3fc92330f255fae497a8'
  end

  conflicts_with 'consul-aws'

  def install
    bin.install 'consul-aws'
  end

  test do
    system "#{bin}/consul-aws --version"
  end
end
