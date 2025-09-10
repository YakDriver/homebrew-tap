# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '1.10.5'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.10.5/nomad_1.10.5_darwin_amd64.zip'
    sha256 '9087b0420b89c65cc52843c7f495bbb813ef8f7f3a4837ab2d6d379dea55e9a0'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/1.10.5/nomad_1.10.5_darwin_arm64.zip'
    sha256 '678efab703b58af5c2fee661fc1bbdbd92ad32b7199c25eb65b75b472204fe32'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.10.5/nomad_1.10.5_linux_amd64.zip'
    sha256 '4242244ab1f6887e963d6bb674ac490ee9b270a29aff6f826c51ef3187c77044'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.10.5/nomad_1.10.5_linux_arm64.zip'
    sha256 'a24f3f3d230ceacdef3c69cf264ffa913d2cf90fd862d26d36c87a6d04512e22'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
