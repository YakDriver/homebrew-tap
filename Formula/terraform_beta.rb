# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.14.0-beta3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta3/terraform_1.14.0-beta3_darwin_amd64.zip'
    sha256 '2dc686a3298212ba8d877e5de16c591d46d22ed76d24f9360d548779fd25d07c'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta3/terraform_1.14.0-beta3_darwin_arm64.zip'
    sha256 '6136b3e63767fc0a869f64fc337da62e3cda6af4bd70741b927b3a3bda4e9045'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta3/terraform_1.14.0-beta3_linux_amd64.zip'
    sha256 'e8923de98f066ff2078571e5adf14ed915fe2e34e08dc936190e8a22c5b3fe77'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta3/terraform_1.14.0-beta3_linux_arm.zip'
    sha256 '7c924086effb5125e3831176453aef325ab7bf283b342ea20fcf43c5739646b9'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta3/terraform_1.14.0-beta3_linux_arm64.zip'
    sha256 '829d51d4cd85621a4b568c235f142a7b1f0022308ec4dd3571db4a88626e6df4'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
