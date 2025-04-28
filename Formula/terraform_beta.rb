# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.12.0-beta3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-beta3/terraform_1.12.0-beta3_darwin_amd64.zip'
    sha256 'f484a640fc20561e0072309d0b461c17e07c9042e0bf361fa1cd13c9978d697c'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.12.0-beta3/terraform_1.12.0-beta3_darwin_arm64.zip'
    sha256 '32748b104a4ba1b510bf16eb6ab75fdbe6a7cf6453d49672d41a3e2596247678'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-beta3/terraform_1.12.0-beta3_linux_amd64.zip'
    sha256 'f040fb4d80889ccca5623a20aed8c8fed8ec4316e20b8361aaf9e9b8d6d657e0'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-beta3/terraform_1.12.0-beta3_linux_arm.zip'
    sha256 '43e232eb818cbf4d193ba01560671ae83073ab474d6bf65073c0d2a53d03ea7a'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-beta3/terraform_1.12.0-beta3_linux_arm64.zip'
    sha256 '1acfd21e19843c4069345e0d48c7daf3665ac03ab10ac26a33d75fd4b570013d'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
