# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.12.0-alpha20250312'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250312/terraform_1.12.0-alpha20250312_darwin_amd64.zip'
    sha256 'cc233e9d034757825129f0cf80b04c55dfa00378265674bc7ba831964eb5e798'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250312/terraform_1.12.0-alpha20250312_darwin_arm64.zip'
    sha256 'b8b0de20f5d82ccd54c0dd29bb56aa8ce88ec01f3a2ee22de0c6c8166c487625'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250312/terraform_1.12.0-alpha20250312_linux_amd64.zip'
    sha256 'a991076271d0afb4b3e9d54f7fb27edad577feeed289f402de7525d7100beb88'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250312/terraform_1.12.0-alpha20250312_linux_arm.zip'
    sha256 '9990ce74c031f21bb5691c13b2b3248f2c6bcc939300e62c072a98fca5f0820d'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250312/terraform_1.12.0-alpha20250312_linux_arm64.zip'
    sha256 '048c77e98060d228b57f4b2f3018cbbc6e87a03d40e658918af1b0456f6a8265'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
