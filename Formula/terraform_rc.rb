# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.10.0-rc1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc1/terraform_1.10.0-rc1_darwin_amd64.zip'
    sha256 '561904d1e1fdfa7ceb03e8c2e497be28ae2ad1f02295619e1f3e7fb2e9c46e45'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc1/terraform_1.10.0-rc1_darwin_arm64.zip'
    sha256 'c0e5e60184a5698fbeb67408dc16cf8600ba0e20e7d9bf0a1d56d8f19e7f2938'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc1/terraform_1.10.0-rc1_linux_amd64.zip'
    sha256 '46188374ce0a6ad6c3d54013798891aac781e40abcd1213808c4c26f86af51e2'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc1/terraform_1.10.0-rc1_linux_arm.zip'
    sha256 '1bbbcbd20abaa9c71d90fc7e76990e542b6be18881ebcafa06bae7597e5165b6'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc1/terraform_1.10.0-rc1_linux_arm64.zip'
    sha256 '1c2d9233dafc3f96b493a9f7a9bb19a3f3f9eb220127b81607c613863a21fe93'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
