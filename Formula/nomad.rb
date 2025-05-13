# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '1.10.1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.10.1/nomad_1.10.1_darwin_amd64.zip'
    sha256 'b1485cff769121b786dba35806d7820f4dc4ac5df2e248236f707d2ed6741fcc'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/1.10.1/nomad_1.10.1_darwin_arm64.zip'
    sha256 '3621b5b1f0a0a78f708aa16743f00bb822499fa0451677f685546bbfc5102bff'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.10.1/nomad_1.10.1_linux_amd64.zip'
    sha256 'cc1cffd95d81943d0a7f8abe7dc2b025a644512d1af253456267caebc1f38065'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.10.1/nomad_1.10.1_linux_arm64.zip'
    sha256 '8d6dd97e43a448ab8369e8cb91c33db98ee45f198400776a1ef5877331ddb0bb'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
