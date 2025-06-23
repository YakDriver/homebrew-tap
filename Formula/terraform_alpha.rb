# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.13.0-alpha20250623'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250623/terraform_1.13.0-alpha20250623_darwin_amd64.zip'
    sha256 '2cfcc97acf91d0e6df39ede46a18a600eb280eb1c28abaeafb92221758ba1b78'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250623/terraform_1.13.0-alpha20250623_darwin_arm64.zip'
    sha256 'd9b7b606f62e97861a6c77fa7816291d8960b0c1e3a2a6c9d2b9614409b3e371'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250623/terraform_1.13.0-alpha20250623_linux_amd64.zip'
    sha256 'e9e6ae3b0107d083f77423d4eaf2555b693d2d5bf4a54d4c315fc6e3535b37b8'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250623/terraform_1.13.0-alpha20250623_linux_arm.zip'
    sha256 'ce4885e4e6bce99ab78f5506b2bab0c1cd36430916463d25609f09ea376d5d14'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250623/terraform_1.13.0-alpha20250623_linux_arm64.zip'
    sha256 '0773c6c678d6b1728adc55ae4c0b2ca6fcbebb8dfacdb0759549cda0dc699a3e'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
