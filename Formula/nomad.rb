# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '1.9.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_darwin_amd64.zip'
    sha256 'b75b1e907dd30e04912df1bbb53089a48261e636062fd137b9c88c40b0cc4f63'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_darwin_arm64.zip'
    sha256 '5c2d1303909df609f8774ca9b2a9c8b5af37fc6a92f0c26cbeae1898c31e1859'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_linux_amd64.zip'
    sha256 '517bce4fcebdc71335ac33a1e34a4c262d2417d8ed4e60cf895fc59e69d70c84'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_linux_arm.zip'
    sha256 '6ce27b3721483527d6490d50db9d742887a2499574063d2c45ee050d39e1c9d7'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_linux_arm64.zip'
    sha256 'bd5dd97272c6b4bfeedb2a48c21ae45b2e396c089525003e4e2c8f4b04945da5'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
