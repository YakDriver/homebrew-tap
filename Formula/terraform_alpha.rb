# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.14.0-alpha20250716'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250716/terraform_1.14.0-alpha20250716_darwin_amd64.zip'
    sha256 '7347cde817980c69da13812f68625637308649a87a044ce8e26f77b74c4120bf'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250716/terraform_1.14.0-alpha20250716_darwin_arm64.zip'
    sha256 '2c4d2c8d6410835c116d2ccf9696f1686e9170e763f920a8f463d2b9f838382c'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250716/terraform_1.14.0-alpha20250716_linux_amd64.zip'
    sha256 'eba85091f06922dddb6514247407718b34163074e9391c526e2d5740b8e78a95'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250716/terraform_1.14.0-alpha20250716_linux_arm.zip'
    sha256 '013ab71e1b4c1bc175d331aa99014de0a8c64819a9c7aeca0655224e0a4d175c'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250716/terraform_1.14.0-alpha20250716_linux_arm64.zip'
    sha256 'd9e8c10c780b8e6bd4be04a1536bc7ffc920bbdfbb59952a2febf4bd1b3b9b7e'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
