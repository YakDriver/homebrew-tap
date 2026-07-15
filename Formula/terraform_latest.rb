# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.16.0-alpha20260715'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260715/terraform_1.16.0-alpha20260715_darwin_amd64.zip'
    sha256 '1849b890d873c31b0234f3436f2fcd9ae5c25a0255dc7bbd073aeec4177fb4af'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260715/terraform_1.16.0-alpha20260715_darwin_arm64.zip'
    sha256 '8d6d6fbb9fa6e39f86ff593d31d4af5cea9d4b7d1008e7052862cd63ea1d95b5'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260715/terraform_1.16.0-alpha20260715_linux_amd64.zip'
    sha256 '0cae729b176b678c8cfc742c05a5fb4c822bb2eea79a6746b7c9a1d40367b6ca'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260715/terraform_1.16.0-alpha20260715_linux_arm.zip'
    sha256 '679e12da7dc74b40e28ec006d54daa3bb4c5a394275960c481f7f8f49367dcb9'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260715/terraform_1.16.0-alpha20260715_linux_arm64.zip'
    sha256 'f67397ae90ef26beefcc4f93776034ae21d9aa00337cb88d9d330cf491629430'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
