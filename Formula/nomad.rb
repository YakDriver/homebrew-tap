# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '2.0.5'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/2.0.5/nomad_2.0.5_darwin_amd64.zip'
    sha256 '17475f2e3c6411ee68355e95845872fe2c30f336e6f31f3cb16c88990b98a13a'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/2.0.5/nomad_2.0.5_darwin_arm64.zip'
    sha256 '6074494a4d6d46933c7ee9c380b15f1e7c602e42c8148d15420ed32eb16c8cd4'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/2.0.5/nomad_2.0.5_linux_amd64.zip'
    sha256 '6425e43967bb0b2b4979b0d06da9b06772848b658dae372f1256d51ddcfe53c3'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/2.0.5/nomad_2.0.5_linux_arm64.zip'
    sha256 '63186442061f3f86ec7d10615a91435779a84ed2bf6111bfcba3c0acf71dabb7'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
