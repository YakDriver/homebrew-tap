# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.11.0-alpha20241211'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241211/terraform_1.11.0-alpha20241211_darwin_amd64.zip'
    sha256 '18520d984e90d5b03ea8ee2ac614d71438713dbcb0a5dd6ee87beb858d293b2a'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241211/terraform_1.11.0-alpha20241211_darwin_arm64.zip'
    sha256 'ccec65b2447707bcda3df31e46136eaf3e66244af4aafac371af1733250d237c'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241211/terraform_1.11.0-alpha20241211_linux_amd64.zip'
    sha256 'dd68a600989c122c5e2ca9fd055f071bfbff8fa7047b48349489e4290b62b8c5'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241211/terraform_1.11.0-alpha20241211_linux_arm.zip'
    sha256 'e461764fb3840ecab0096c3607291632e5730a2aa32d16681c8c05cde54ba8a1'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241211/terraform_1.11.0-alpha20241211_linux_arm64.zip'
    sha256 'a4c97c64b418def442e13f65a7e0e176cc55b76d3f94893660309a5c6c066397'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
