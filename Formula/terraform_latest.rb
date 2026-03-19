# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.15.0-beta1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta1/terraform_1.15.0-beta1_darwin_amd64.zip'
    sha256 '94cf1da9e147d914a0bd47196bb5fb01dbd2c30c547fdd0a0589ffa2c45c1af9'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta1/terraform_1.15.0-beta1_darwin_arm64.zip'
    sha256 'c37a0850c2a0abacca41a276b6614acee111114a19ce58e573ad670ce15f69b0'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta1/terraform_1.15.0-beta1_linux_amd64.zip'
    sha256 '5ed7e696d5d27cb723746092c50998a7f07162e5d627aff4bcc018e20a90a6e5'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta1/terraform_1.15.0-beta1_linux_arm.zip'
    sha256 'eacabeb9f879ebd5372cb4b7052ad5d00e2c7203050fa03a5e27de634561c079'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta1/terraform_1.15.0-beta1_linux_arm64.zip'
    sha256 'efa4f88832d61a12856be172cad52d041933d4d63486ca04be1f84becc6df144'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
