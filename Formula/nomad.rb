# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '1.9.2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.9.2/nomad_1.9.2_darwin_amd64.zip'
    sha256 'fde7dbf9d4bce1e3d60ae274af1e30a96d7119050f146bfe5753c1003f58d0e1'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/1.9.2/nomad_1.9.2_darwin_arm64.zip'
    sha256 'b919e97481395683aeaa3b119368d4bb8d2a07f351a8b20a4c58db5a94b05100'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.9.2/nomad_1.9.2_linux_amd64.zip'
    sha256 '23e07975ceb6f5adcf23afaed1ef50810eaee6c894bce915afa04c82a85e8e7c'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.9.2/nomad_1.9.2_linux_arm.zip'
    sha256 'bd34bbad46949665df5084ebe7c3fe40374e7104b4fd5debd2d898bf25410334'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.9.2/nomad_1.9.2_linux_arm64.zip'
    sha256 'c3e65d736e2b7da13c041f49c3f419162006895223ddc492e27b532a9a199998'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
