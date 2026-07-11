# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '2.0.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.3/vault_2.0.3_darwin_amd64.zip'
    sha256 'a3462df67c00d1092727dd4fedfba256d2d22d5846fb514c96e03133f567b6af'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/2.0.3/vault_2.0.3_darwin_arm64.zip'
    sha256 'abf89e4e56a3af41471ccccdaac1b691874c5e8b20e72c053133d948be0cec42'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.3/vault_2.0.3_linux_amd64.zip'
    sha256 '1e0ffb7a82491219c7242da6e05e2d756b05d1097c29799a42228661f229bc2a'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.3/vault_2.0.3_linux_arm.zip'
    sha256 'e9cc601f6513f4ca4071576ed1f2dabca79ac668b513b77602529859b6061055'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.3/vault_2.0.3_linux_arm64.zip'
    sha256 '9423a715aea0689f9e498fe7cc5ea692aa1eff282f8b9bc26af28cad69d6d841'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
