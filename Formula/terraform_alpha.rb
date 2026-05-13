# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.16.0-alpha20260513'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260513/terraform_1.16.0-alpha20260513_darwin_amd64.zip'
    sha256 'e126c4b5c0340fcb41cf36ca4311aaa2d6b87046e75f8373a63869d2e9fa4bfa'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260513/terraform_1.16.0-alpha20260513_darwin_arm64.zip'
    sha256 '6bb77df50daabcc06fa2ee10a0bb219645718bb93571449da3c2b790aaab7510'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260513/terraform_1.16.0-alpha20260513_linux_amd64.zip'
    sha256 'e8d7c58f47f6787a9156a8449459eceba057d024c07c0f430f5c93d4fea125ae'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260513/terraform_1.16.0-alpha20260513_linux_arm.zip'
    sha256 '89a68edc02b36a6d4c6837da519321ee503822c98900bf38164b07ea19d6ef4e'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260513/terraform_1.16.0-alpha20260513_linux_arm64.zip'
    sha256 '681bf7c1e237ffc728fe94533e03a30a468126555dbbe8539d0b4c6446af1ba3'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
