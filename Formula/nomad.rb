# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '1.11.1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.11.1/nomad_1.11.1_darwin_amd64.zip'
    sha256 '5bc9474e0e75a4ae856da9b2916caa49836ef5819461490706e2b4ebc710e253'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/1.11.1/nomad_1.11.1_darwin_arm64.zip'
    sha256 '8527f146a042370443b3bc1ff634d2308716c2f62211a0e4c5b3bd546a8cf87c'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.11.1/nomad_1.11.1_linux_amd64.zip'
    sha256 '8e8fbc9c3ddae39a63f7ed70a99bb4b936bb6e88ed9160ce0e9d36ff2909c1f3'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.11.1/nomad_1.11.1_linux_arm64.zip'
    sha256 'a120ba1be96d536ef7196911b57bfbe78fe08c53935dfd16eae0206eba09d729'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
