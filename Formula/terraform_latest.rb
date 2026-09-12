# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.17.0-beta1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.17.0-beta1/terraform_1.17.0-beta1_darwin_amd64.zip'
    sha256 '211ee1fd1d8587680136da1706df17479f6b96d857dbbdc27271b55ebd39cf63'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.17.0-beta1/terraform_1.17.0-beta1_darwin_arm64.zip'
    sha256 '88269fa7fa3461f6ba577a736df7d8ee26f8b1d4d986feeb1e55d3d8f2399132'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.17.0-beta1/terraform_1.17.0-beta1_linux_amd64.zip'
    sha256 '98e1a60a74fcabc28d9c2c66da910e71b0e5905e82467c620678cdb5be7342fa'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.17.0-beta1/terraform_1.17.0-beta1_linux_arm.zip'
    sha256 '4e433704954f59b895200c71fb0d5fb13155e6ce03f5465f449104f69e2b9723'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.17.0-beta1/terraform_1.17.0-beta1_linux_arm64.zip'
    sha256 '0f1adab6410a998669ce6145c28df4cd8df79c185e1c965c3122cd75d436e661'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
