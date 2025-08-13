# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.14.0-alpha20250813'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250813/terraform_1.14.0-alpha20250813_darwin_amd64.zip'
    sha256 '7c5f0bc4d2df86e7378937e5ddeba6c2edc41a9b9103af882fb28ba1d7d8734f'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250813/terraform_1.14.0-alpha20250813_darwin_arm64.zip'
    sha256 '3f33b7800fdd6dc408832a8c4ebed344599d937e8072c0a0cac3d8fcbeba975a'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250813/terraform_1.14.0-alpha20250813_linux_amd64.zip'
    sha256 '6f17c04b0a902a59d9abe5597df650bf662f720d49ec4adc693c99f60eb0d186'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250813/terraform_1.14.0-alpha20250813_linux_arm.zip'
    sha256 '2d732c24545d7b91f6e3cae70717fca2ef443cfcc35547b3535acc5230528bd0'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250813/terraform_1.14.0-alpha20250813_linux_arm64.zip'
    sha256 '1f46ae442287f39932601dfec6db6e9a462a1f82c17d9fd54d70eb0b5cd39f6b'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
