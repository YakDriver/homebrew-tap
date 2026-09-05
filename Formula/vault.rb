# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '2.1.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.1.0/vault_2.1.0_darwin_amd64.zip'
    sha256 '4ec95a88b3ab2a4f367da41ab98946204d5d85b36b26b71c6685db997dfde36e'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/2.1.0/vault_2.1.0_darwin_arm64.zip'
    sha256 'c6589dc658f72ebd2792b1fba7b2e53413367ad673ae2513cfdec6422ed4da2c'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.1.0/vault_2.1.0_linux_amd64.zip'
    sha256 '08e8a13d29d20c5e28ef5e2c187bf3a2e84712a43615de1b3d24701ad9aab972'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.1.0/vault_2.1.0_linux_arm.zip'
    sha256 '8732a7d9a957c4b6675c77bcf3f3fd2ac8204cca21913971ccd525e397f37826'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.1.0/vault_2.1.0_linux_arm64.zip'
    sha256 '319b3eb7b0c2ad218453f5d1af5c23cac81a024db3a07ccd2494ecd31f2090c3'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
