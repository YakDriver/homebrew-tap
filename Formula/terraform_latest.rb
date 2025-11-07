# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.14.0-rc2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc2/terraform_1.14.0-rc2_darwin_amd64.zip'
    sha256 '0835e756e92392888fc5e4a6c620b99997dc50be749fd389d717b4e87876ca48'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc2/terraform_1.14.0-rc2_darwin_arm64.zip'
    sha256 '9390bbbcaae7cd8b64ec20db49c672926f8622d2f158b0e06f121207f384c8c3'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc2/terraform_1.14.0-rc2_linux_amd64.zip'
    sha256 'a3d896dd2aa998916f44afb5d8f3792036e19fd93360ebedea3b9b1f5b10d507'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc2/terraform_1.14.0-rc2_linux_arm.zip'
    sha256 '2f065c7bec9cdf3f73502913533bb95f09ab6eb32e0460f515f74a216309e7c3'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc2/terraform_1.14.0-rc2_linux_arm64.zip'
    sha256 'd866a40f7416edfb0f2c819aaac3e697d63f68f5eb58f6636b202253bb283754'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
