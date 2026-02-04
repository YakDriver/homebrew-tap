# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.15.0-alpha20260204'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260204/terraform_1.15.0-alpha20260204_darwin_amd64.zip'
    sha256 '5ae51274ec1dc4dd3b9dc30b8768701148dcdcb808d38cae07873d0f0ff542d1'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260204/terraform_1.15.0-alpha20260204_darwin_arm64.zip'
    sha256 'f5a341616382332875cc7b036c226cdf3ec43764de25d1f6fd5dfbd8be236ab6'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260204/terraform_1.15.0-alpha20260204_linux_amd64.zip'
    sha256 '4f12a02e70f44574eccafb15617a5b92767279fdae015d831524dc9bef0d173c'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260204/terraform_1.15.0-alpha20260204_linux_arm.zip'
    sha256 '67e3ad3ec18da3b905117333e82d1333524d1da19394311b32c35997eb02dedb'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260204/terraform_1.15.0-alpha20260204_linux_arm64.zip'
    sha256 'a1663e39c09093ec752305b08509f854215a5a9b026eceff20d6459d85e07872'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
