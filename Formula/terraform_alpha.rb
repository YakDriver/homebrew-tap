# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.16.0-alpha20260701'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260701/terraform_1.16.0-alpha20260701_darwin_amd64.zip'
    sha256 'd03891e506d93b20b2450780715caa1765a7f075424097f33de9f018e5159768'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260701/terraform_1.16.0-alpha20260701_darwin_arm64.zip'
    sha256 '4aa029c24daf565024a88a6c8ce2fe00f4ba3f161388cba429c3ce35e5f009dc'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260701/terraform_1.16.0-alpha20260701_linux_amd64.zip'
    sha256 'a50bb869d12a8b60604d060bccb26b7325560866bf23359c750878f5e581b80d'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260701/terraform_1.16.0-alpha20260701_linux_arm.zip'
    sha256 'e189d87996f10d826f3e68492119d5a432d179393abc8d316fe8550c3b0d1fcc'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260701/terraform_1.16.0-alpha20260701_linux_arm64.zip'
    sha256 '2dce0f328ae40d35860bce5bb06d6cd650f09597800dbea2e5b81e6276e546a2'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
