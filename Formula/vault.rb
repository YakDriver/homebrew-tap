# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '1.20.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.20.3/vault_1.20.3_darwin_amd64.zip'
    sha256 'c83250d6432a200f6fdbda3e648351858ea8754d20147a761fc85f40f4357d13'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/1.20.3/vault_1.20.3_darwin_arm64.zip'
    sha256 '134ca9433205d065180073f2e02c62558e4ee7d06115112189746991a40b8fde'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/1.20.3/vault_1.20.3_linux_amd64.zip'
    sha256 '128d35b82bed319b8ce3caec99286a7d458342d8def5e6ca4d20cc7621df53d3'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.20.3/vault_1.20.3_linux_arm.zip'
    sha256 '7375fbf8a234d062814a784560cddbe8e7e071c62fc3c9647b1306c2a36c7dee'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/1.20.3/vault_1.20.3_linux_arm64.zip'
    sha256 '35847f819eb3917f1b454994bd517bf4f83fdbd7e9a06fa17f37a7c99ab7eb9d'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
