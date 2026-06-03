# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.16.0-alpha20260603'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260603/terraform_1.16.0-alpha20260603_darwin_amd64.zip'
    sha256 '47d2a34a08faf1cf9f3667d45ada5089677505d43b13caeee85dcaba130489cd'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260603/terraform_1.16.0-alpha20260603_darwin_arm64.zip'
    sha256 'eee7e5d8c816564c3fa9aa4a2bf80ab3df2972d742146984fbb0ce8b7c930159'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260603/terraform_1.16.0-alpha20260603_linux_amd64.zip'
    sha256 '7b9b31fc7b7f242528978bdffec938667e658bcaebf6d77907b93c6af2f7a9a3'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260603/terraform_1.16.0-alpha20260603_linux_arm.zip'
    sha256 '250da4636b4c0b6d9ded58cd5efdb7141b2ff18b7752b53d70b8e264ede70049'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260603/terraform_1.16.0-alpha20260603_linux_arm64.zip'
    sha256 'ae0022a5fe745faadee59d4d66a73593062c00bf040484bb1b9bb403bb255a45'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
