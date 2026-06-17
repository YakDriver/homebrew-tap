# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.16.0-alpha20260617'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260617/terraform_1.16.0-alpha20260617_darwin_amd64.zip'
    sha256 '84eac4b72f3f95927939f36a8363e094aa3a24e22659618f6a7a209a5b9a5e55'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260617/terraform_1.16.0-alpha20260617_darwin_arm64.zip'
    sha256 'e4c66465895ae2686f7292a472776d52b2e0025c0c736483755235308371d040'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260617/terraform_1.16.0-alpha20260617_linux_amd64.zip'
    sha256 'd4609112499fe1fa6dcd0054811b51746d7fcf9f8198cb6990302e433c191bd4'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260617/terraform_1.16.0-alpha20260617_linux_arm.zip'
    sha256 '7a506a058c1dd369bc057f549f35fc8ea8b1e83fc24261790ff52ecb8c6d7a68'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-alpha20260617/terraform_1.16.0-alpha20260617_linux_arm64.zip'
    sha256 '156dca14e977420af3525ad1621d08131fea9e1e611fe72c84fe845753c4f54e'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
