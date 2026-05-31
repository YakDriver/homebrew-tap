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
    sha256 '2bf66eb99191517c094b3066f818f4a57cc2eae3bcdec6af3601d6044d25ee09'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_darwin_arm64.zip'
    sha256 'eed0089ec9b7646074b3555e697abb9522ea26ed31b08f53e225f4e130a4aa86'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_amd64.zip'
    sha256 'c6ed3be36a750875906916716680322719920a102f98c9a0b3105ecff63b9e34'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_arm.zip'
    sha256 '16358846b749084d7d8967a43e971e6dd3f059186d7625f246b0b07330f1f374'
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
