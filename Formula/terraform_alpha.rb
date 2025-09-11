# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.14.0-alpha20250911'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250911/terraform_1.14.0-alpha20250911_darwin_amd64.zip'
    sha256 '8ff8542b6df9a06129f66d1f20255469f32a76b69a420b70bc8241ca605a1591'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250911/terraform_1.14.0-alpha20250911_darwin_arm64.zip'
    sha256 'fdbccdc60a0fc38d1e0830b4744f6f07c25ae7e6f89c5fc32a98c52e1e44ef44'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250911/terraform_1.14.0-alpha20250911_linux_amd64.zip'
    sha256 'ece2d341d1e270635687b0197a21699743010bdfb757f3750e582c85428832bc'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250911/terraform_1.14.0-alpha20250911_linux_arm.zip'
    sha256 '08462c2d55e527d55263af57465038db3fa9270cf9a1f11d627c0fc1965306d8'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250911/terraform_1.14.0-alpha20250911_linux_arm64.zip'
    sha256 '70b6c093d68d0fb64e3597e5ed47dd4d8a6a6566f8bb5027cfdc6adf81709ed6'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
