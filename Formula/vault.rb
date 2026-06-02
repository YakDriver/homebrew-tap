# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '2.0.1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_darwin_amd64.zip'
    sha256 '3c38aa3d729a8e8b0625d187b6fcda40653ddbbc8b477b01220da6e6a0ae3384'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_darwin_arm64.zip'
    sha256 'bbe929eaa9abd9e56c83a5b5a58ef89e682563d00a1c00c3f8a5a0924eb71c76'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_amd64.zip'
    sha256 'c6ed3be36a750875906916716680322719920a102f98c9a0b3105ecff63b9e34'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_arm.zip'
    sha256 '1905a8a72ee26556dc59b5f6e1d2bccfa8b187fc2969dd0e67a036c80f2b9ddd'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_arm64.zip'
    sha256 '02c7400faff71e284f4140a9119fe2eeba3ed472c467fe175a13e70fbb7ce821'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
