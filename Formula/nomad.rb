# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '1.10.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.10.3/nomad_1.10.3_darwin_amd64.zip'
    sha256 '4ebc601dc0966c1d3ce0a7fbb7718fa02624fef4ebbeeabf945b11c6e47732da'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/1.10.3/nomad_1.10.3_darwin_arm64.zip'
    sha256 '79e0aba45d4b087b248682056f2f3731ae974483cd87e5d2cd15a8938acea357'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.10.3/nomad_1.10.3_linux_amd64.zip'
    sha256 'a161b8d59b42555d97d37f7a75c122831be485e89dfb97d16d6b60cfaec8d88b'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.10.3/nomad_1.10.3_linux_arm64.zip'
    sha256 '33d29315154035295a0f735622da4322ea500e49b5f85686139e76a5e89a7ce9'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
