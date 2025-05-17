# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '1.19.4'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.19.4/vault_1.19.4_darwin_amd64.zip'
    sha256 'd2a018d8b3dbfb2dcaf596f76020993f3d03a57b9fb89e183e5fd22b2cb84d15'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/1.19.4/vault_1.19.4_darwin_arm64.zip'
    sha256 '903bde4d58733c39a9b6ec750d34e5daaa80e351c7d0420799dd025d91b27a3e'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.19.4/vault_1.19.4_linux_amd64.zip'
    sha256 'd8621f31427ecb6712923fc2db207b3b3c04711b722b11f34627cd4cf837a9c6'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.19.4/vault_1.19.4_linux_arm.zip'
    sha256 '0ac16fd75c16e11e1d59f2d156926b68118aa6dd9ec0b5be7069681c9bd7464d'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.19.4/vault_1.19.4_linux_arm64.zip'
    sha256 'ed407354d118b841086fdc1786f2e6b0d52dadf84659529f1a7db24912fc6698'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
