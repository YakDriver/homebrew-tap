# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.16.0-rc2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-rc2/terraform_1.16.0-rc2_darwin_amd64.zip'
    sha256 '6c79f61fcffc25a79603a900517d1410e0cd3500be1dccc424d2a92cbcc1c7c4'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.0-rc2/terraform_1.16.0-rc2_darwin_arm64.zip'
    sha256 '32de6361464e8ddcba1e50a9080b14923eeaab427ce36eb67550b09b09089117'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-rc2/terraform_1.16.0-rc2_linux_amd64.zip'
    sha256 '1b98f5e5a4ec44e102e43c42b84f3bfe68d4da726fbbf1f5ff526076cfb85d0b'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-rc2/terraform_1.16.0-rc2_linux_arm.zip'
    sha256 '9b64c2c1d44db3c27fd119d52013dc3662ea13a6a8c947c30c203ad4e9a1c1c8'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-rc2/terraform_1.16.0-rc2_linux_arm64.zip'
    sha256 '7c23c57aff40bd03b370629e182b9d11b0088cab5f34a87acf7c6ac593131d70'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
