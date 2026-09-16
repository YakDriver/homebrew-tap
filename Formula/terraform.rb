# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest stable version of the Terraform CLI tool.
class Terraform < Formula
  desc 'Terraform'
  homepage 'https://www.terraform.io/'
  version '1.16.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_darwin_amd64.zip'
    sha256 '1b933c61782390531374290309ada8406cd923647893c2f52b5dd838de23803a'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_darwin_arm64.zip'
    sha256 'c2c45425ea4568da9803e127e589186cb3798a5944d9aff5a5bc15dd18267560'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_linux_amd64.zip'
    sha256 '093b6ae9a2228af5029c41606bc96eb583553528aad1bfe7e0b4d62fc91e25d8'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_linux_arm.zip'
    sha256 '2f50d88b99d7c0145cc1cf51adf92c46cbff6f211a7539c44bf3319baa50bb5f'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_linux_arm64.zip'
    sha256 'b6b293550af7a6a7ffd867a04900ce161db86ec9407b234a636c2adbae2ca9f0'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
