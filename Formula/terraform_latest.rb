# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.15.0-alpha20260304'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260304/terraform_1.15.0-alpha20260304_darwin_amd64.zip'
    sha256 '0929e727d7fcdab600a56e8983b2a04bc03550a8465a6b6d6ac9a35d1b43369c'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260304/terraform_1.15.0-alpha20260304_darwin_arm64.zip'
    sha256 '3180e0aecf4ad414be38cad247afd5191a73ffcec4520f2f8807c3870fbb4dfb'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260304/terraform_1.15.0-alpha20260304_linux_amd64.zip'
    sha256 'd2aa7b64b8d116aa82ba5a3be72a664d1104be4371f611c002231a5e752b492e'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260304/terraform_1.15.0-alpha20260304_linux_arm.zip'
    sha256 'cf1867da97f907dc71a95c1c8d5da8b19873fdfe90d34662833e0322c27fb562'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260304/terraform_1.15.0-alpha20260304_linux_arm64.zip'
    sha256 '92a309d1df4e82601e8b79459dfec47092bcdc2676d5dda6d64a9b14905a2f9d'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
