# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '1.21.0'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.21.0/vault_1.21.0_darwin_amd64.zip'
    sha256 '2e00e327be8141751f7bcc840aad93c8a5428908a4131f17d02d22eab444bcf2'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/1.21.0/vault_1.21.0_darwin_arm64.zip'
    sha256 'fd1b26fcbc78c04c2d76d35a13a9564d450074f2547871b2046ddb95bbd7ea9c'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.21.0/vault_1.21.0_linux_amd64.zip'
    sha256 '5a91c93a9949ed8863ee4b91cfc30640bc49ab04225f0b1c5a0650c4d6e10171'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.21.0/vault_1.21.0_linux_arm.zip'
    sha256 'bbccbb8c6b8f12e778a3eafcc02610943614880b9524732f1549ecf0020c2fe7'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.21.0/vault_1.21.0_linux_arm64.zip'
    sha256 '0083b02005ad89f6a01773866c6a892194ba27867b5f26ee374a0dfbbfb84c07'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
