# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.14.0-alpha20250903'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250903/terraform_1.14.0-alpha20250903_darwin_amd64.zip'
    sha256 'a4009f250bb3514c562e0b19bf339052ff5cea523928c9009251438f12172d9d'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250903/terraform_1.14.0-alpha20250903_darwin_arm64.zip'
    sha256 'c9270dd180181a0c7d32f581470304efa35b5928474543e2f63e1d00f3324834'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250903/terraform_1.14.0-alpha20250903_linux_amd64.zip'
    sha256 '7b508fe61cb8f1070c8c03d269eeb6ed6c935771509b87f3b95d500c467c8f6f'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250903/terraform_1.14.0-alpha20250903_linux_arm.zip'
    sha256 '75ccdb068302025a05590035830093f55ae437059c7d952556e04059201478d7'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250903/terraform_1.14.0-alpha20250903_linux_arm64.zip'
    sha256 '8e09fd632941fefbf5259a30ed5a94edc50e8bbf17e1cc8a70fcb27b9a68cc81'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
