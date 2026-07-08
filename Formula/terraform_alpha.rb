# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.16.0-alpha20260708'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260708/terraform_1.16.0-alpha20260708_darwin_amd64.zip'
    sha256 '61fa8a63ee49a1ab8a083f93b9df15e9fc7ff578c6b012b6f2125d9e3151965e'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260708/terraform_1.16.0-alpha20260708_darwin_arm64.zip'
    sha256 '443d008d053fdcbc677a31e28af44c950fd78936f19617b9632111dc2aa7d5b3'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260708/terraform_1.16.0-alpha20260708_linux_amd64.zip'
    sha256 '12340bc6a0b30eb1c80ce0433d48bf44b4d34cbb61f74cc93cf0d7ea939bfd50'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260708/terraform_1.16.0-alpha20260708_linux_arm.zip'
    sha256 'd387de2d07907d0e74da3cbc16d40176311ee0f7f02ec554716ac31353670237'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260708/terraform_1.16.0-alpha20260708_linux_arm64.zip'
    sha256 '1cd9f9ce63019e107eb331c2ff58b962a961dfb440162790ef13a447bdc41f6f'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
