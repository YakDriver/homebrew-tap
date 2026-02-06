# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '1.21.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.21.3/vault_1.21.3_darwin_amd64.zip'
    sha256 '77a60ce6e74351fe29d45f131a91777769e5fc90dcedbe4983b62b48fbbf45ae'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/1.21.3/vault_1.21.3_darwin_arm64.zip'
    sha256 '65a4e5b2744bece121cf07256eda9ec856f5c7a9178fbafe3dd9036b5ed7ea37'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.21.3/vault_1.21.3_linux_amd64.zip'
    sha256 'c945e90979a7b6e4b4846285587c35b25f8191f9f70cb879132bc118ae42c368'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.21.3/vault_1.21.3_linux_arm.zip'
    sha256 'a4fe487d4ccea052221b61d0db377e03e450b5dcff0e49865b12820b5e21e7e2'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.21.3/vault_1.21.3_linux_arm64.zip'
    sha256 '9aa275c7de486413a414f62201090762245723f9ec8620a3ad1c49699a9c35a2'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
