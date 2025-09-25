# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '1.20.4'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.20.4/vault_1.20.4_darwin_amd64.zip'
    sha256 '0abe8673c442710795b0182c382dd5347b961d2c0d548742813b3ecbe15bf7cc'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/1.20.4/vault_1.20.4_darwin_arm64.zip'
    sha256 'cca50f328a44e025205047d480bead1460012ecd82fa78387c7b5af0bae59d02'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.20.4/vault_1.20.4_linux_amd64.zip'
    sha256 'fc5fb5d01d192f1216b139fb5c6af17e3af742aaeffc289fd861920ec55f2c9c'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.20.4/vault_1.20.4_linux_arm.zip'
    sha256 'a492e52cda2da0f04c77e4826fcfaf0cdd045a55dc6d2f25bd0768f0890e6162'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.20.4/vault_1.20.4_linux_arm64.zip'
    sha256 'd1e9548efd89e772b6be9dc37914579cabd86362779b7239d2d769cfb601d835'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
