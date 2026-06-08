# frozen_string_literal: true

# Vault is a tool for securely accessing secrets and managing sensitive data.
# It provides a secure way to store, access, and distribute secrets across distributed infrastructure.
# This formula installs the latest stable version of the Vault CLI tool.
class Vault < Formula
  desc 'Vault'
  homepage 'https://www.vaultproject.io/'
  version '2.0.2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.2/vault_2.0.2_darwin_amd64.zip'
    sha256 '347c589302107d5debc1403761163fa01e1db558532acb5f8f55e5e8cb18f170'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/vault/2.0.2/vault_2.0.2_darwin_arm64.zip'
    sha256 '69eb2a89f5c9715105f80d834c5252b9ea2fc2d41297e8c7be595ff028f6efe7'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/vault/2.0.2/vault_2.0.2_linux_amd64.zip'
    sha256 '71e87827fdf6e4cef291b1a1578ce8310d054210750dcfb9f495d51d7da0a9a4'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.2/vault_2.0.2_linux_arm.zip'
    sha256 '360b7dd2b15f17910f12c36712fba429526af4828aa25f5e16471cc8dc5eebb6'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/vault/2.0.2/vault_2.0.2_linux_arm64.zip'
    sha256 '9e496af2f9b8142c0be80e486a46b8c86c87b96ec43e5cbd55d163255d560fd5'
  end

  conflicts_with 'vault'

  def install
    bin.install 'vault'
  end

  test do
    system "#{bin}/vault --version"
  end
end
