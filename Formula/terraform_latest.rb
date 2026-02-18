# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.15.0-alpha20260218'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260218/terraform_1.15.0-alpha20260218_darwin_amd64.zip'
    sha256 '0cbfc86849982eee921306f02aeedca3eb5334decca2328f05112efe3c1f5b51'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260218/terraform_1.15.0-alpha20260218_darwin_arm64.zip'
    sha256 '83942235c02477eb38977f9fe2a26091b49b19c2636bb60dc4c714be851004fe'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260218/terraform_1.15.0-alpha20260218_linux_amd64.zip'
    sha256 '6a4a5df0e7f9b7c4ec215ec6e3a7301ef267c6022e342322f1c89ed311e82ca1'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260218/terraform_1.15.0-alpha20260218_linux_arm.zip'
    sha256 '1c943ef89a76720b64acd1e10c658b7ae148887ebde63e6a2676d3a9b78385c9'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20260218/terraform_1.15.0-alpha20260218_linux_arm64.zip'
    sha256 '539a9a46932bdefb7cbd7b9303e7e0c346f129f4507306922fc2ad5932c28e14'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
