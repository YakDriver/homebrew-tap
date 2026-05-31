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
    sha256 'e34d6161b927b69a47f1c9a1c143fe9acba620d5a556c4718b4d6c81b62eb4af'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_darwin_arm64.zip'
    sha256 '0abb8f22755363673f194cfe10cd5c34936cd0458d35247dc2d500e527b45e89'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_amd64.zip'
    sha256 'c6ed3be36a750875906916716680322719920a102f98c9a0b3105ecff63b9e34'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_arm.zip'
    sha256 '04acb70a3a978476425f265ec2d7cae8de22d9df8b80bd1e571057c5985f02c3'
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
