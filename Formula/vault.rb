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
    sha256 '2c87549f65ff5be102540d2519fca1ffe43df67491331ddff90f2eab908a25a0'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_darwin_arm64.zip'
    sha256 'e040bb0013431f79c826deade0ef62ee4f19c15e5aebb21e9f0b18376ab04c01'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_amd64.zip'
    sha256 'c6ed3be36a750875906916716680322719920a102f98c9a0b3105ecff63b9e34'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.1/vault_2.0.1_linux_arm.zip'
    sha256 '22c0dbda365d00d42ed559cc37603438b259a5e6babbb0b5633461685a22c995'
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
