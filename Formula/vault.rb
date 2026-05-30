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
    sha256 '7e1a638bcaeb3edd93974db36f0f7bf345dd3e79d9e26c3b4323c91ff2a0ff90'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_darwin_arm64.zip'
    sha256 '157b92fdd6006313cabae3b414036accd085182dfcb396dea22020e27003ca57'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_amd64.zip'
    sha256 'c6ed3be36a750875906916716680322719920a102f98c9a0b3105ecff63b9e34'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_arm.zip'
    sha256 '651948f88f83e7e21019d234110d2f54fd091df16fd6be49f64452fe2fa38c11'
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
