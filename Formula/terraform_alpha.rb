# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.13.0-alpha20250702'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250702/terraform_1.13.0-alpha20250702_darwin_amd64.zip'
    sha256 '2221cb3409ddb9b2db02da442895463b101ca65c869550109ffca86ddd5dec5f'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250702/terraform_1.13.0-alpha20250702_darwin_arm64.zip'
    sha256 '197dd08398c8021e7b28fa111a266e5040c768a81917852f7329d3fbe63415ea'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250702/terraform_1.13.0-alpha20250702_linux_amd64.zip'
    sha256 '3b6b6ba823d9c899d78cdc277a988cf74460315360a3aa29e5dfa1aa5996ec94'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250702/terraform_1.13.0-alpha20250702_linux_arm.zip'
    sha256 '7de0b4f601b0d16d7f36bff8d1cfb5a5cc2f0255eae3336ba00431ef0fde24bd'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250702/terraform_1.13.0-alpha20250702_linux_arm64.zip'
    sha256 '9ffe1ebe9361a018930013e18bcb676d615d59aef286c407a0a7872f4731ca84'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
