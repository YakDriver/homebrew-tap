# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.12.0-rc1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc1/terraform_1.12.0-rc1_darwin_amd64.zip'
    sha256 '0788faf006f6932b7d4228e0d8303049aa510037a2d1e70b427d6b32b7c53a89'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc1/terraform_1.12.0-rc1_darwin_arm64.zip'
    sha256 '3495d91e03498a05aa8ee8d52a053e921daabd2ccfc6a660cd709e60ef8e89a9'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc1/terraform_1.12.0-rc1_linux_amd64.zip'
    sha256 'c9f49428056866233c58352e814c0fa14460543c83500e3b4541451003a30053'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc1/terraform_1.12.0-rc1_linux_arm.zip'
    sha256 '49ebbefc2ec59a2d23628de8e83a8e78626b6524eea1a143c859df699441d16a'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc1/terraform_1.12.0-rc1_linux_arm64.zip'
    sha256 '4a75497703a5109a9c5a1b3eb411e5b31f7d0e587a3903b46800bd07a20c145e'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
