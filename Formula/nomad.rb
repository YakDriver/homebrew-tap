# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '2.0.1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/2.0.1/nomad_2.0.1_darwin_amd64.zip'
    sha256 '5bcf1bf5286715b286c827e228e35b74950d540f86874bac9da8ecc6dd8fc741'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/2.0.1/nomad_2.0.1_darwin_arm64.zip'
    sha256 '33b987a15ac4e0936357b643b141ecbb055ac03a5d0e90a8df9677bc14349f31'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/2.0.1/nomad_2.0.1_linux_amd64.zip'
    sha256 'cf5d820b5dc3fcd1ceb8baf3afab46e3a52a56fc3016fcdaed0505f531a39540'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/2.0.1/nomad_2.0.1_linux_arm64.zip'
    sha256 '7fd283c236ebf3df3501350dace8aa7d3cb28e804058d01e0cecda76c5a4b585'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
