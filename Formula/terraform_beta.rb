# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.16.0-beta2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta2/terraform_1.16.0-beta2_darwin_amd64.zip'
    sha256 '2443413ff96bc9c2eef5d32b88605c412405844848f33700fbaa0a6aed33fe0f'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta2/terraform_1.16.0-beta2_darwin_arm64.zip'
    sha256 '98c252da7f470bd7d9a0a6c4815299bddf0c7a25cb6bc3fa0cfda755fd821e8e'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta2/terraform_1.16.0-beta2_linux_amd64.zip'
    sha256 'dcedc40978949fdb09c6204dd9ddbd7bb2ef87d2f73a772aef4ba0e8de275ffd'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta2/terraform_1.16.0-beta2_linux_arm.zip'
    sha256 '62d2f889dde0dc4b88c72d9351d5f0d0a0fab7ac7c96ad8e3d3decd230aac8e9'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta2/terraform_1.16.0-beta2_linux_arm64.zip'
    sha256 'ff75b20f974ecb0528ea233caefec2f976e88b0266c648f7dcc5f1644fdcbd1d'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
