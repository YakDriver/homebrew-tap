# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.13.0-alpha20250604'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250604/terraform_1.13.0-alpha20250604_darwin_amd64.zip'
    sha256 '9b50e489b8cf9e89fe4781d5d2238d95a64df5ca94868d52b7d6852731891bfd'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250604/terraform_1.13.0-alpha20250604_darwin_arm64.zip'
    sha256 '1eaba720713e4ce8d416aaa5911243983e55f5e3e494439b5f4fa246779d4b1b'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250604/terraform_1.13.0-alpha20250604_linux_amd64.zip'
    sha256 '88950402c7ec6378fd5272e3fa70bb1b3a2cfbb8e6ff1810c2fbab7cbe37c0cd'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250604/terraform_1.13.0-alpha20250604_linux_arm.zip'
    sha256 '4ff1b86be048e5fd862d23ec077ed8fbd63fecdb3f4f75adf59bd5503ed67aad'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250604/terraform_1.13.0-alpha20250604_linux_arm64.zip'
    sha256 'd41bc556be4111d7b3d039dcac1bc3362bf7a6b907897026e75ccb7a54d55f93'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
