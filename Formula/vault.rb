# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '1.21.2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.21.2/vault_1.21.2_darwin_amd64.zip'
    sha256 '1bb297df6230212764f24df88b3123419c49be6528743cffcaf8d676547634dc'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/1.21.2/vault_1.21.2_darwin_arm64.zip'
    sha256 'd197adcb303cb527834774e19d6a67abcefb11cc9c57bd42f5bcdd4a1b21be9c'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.21.2/vault_1.21.2_linux_amd64.zip'
    sha256 'd2005a053a2ab75318d395ca8151aef9116fde67f75dc8f43a4fa9def6f3fc9e'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.21.2/vault_1.21.2_linux_arm.zip'
    sha256 'baa04525970fd8ad66e427affd45847df1da10d8f74e41eefb5984b87f14ce45'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.21.2/vault_1.21.2_linux_arm64.zip'
    sha256 '27dc55533a201be4c427319a31caa3ca330cfd40b158d111f22a1dee94ae1f17'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
