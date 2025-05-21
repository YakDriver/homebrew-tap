# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.13.0-alpha20250521'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250521/terraform_1.13.0-alpha20250521_darwin_amd64.zip'
    sha256 'a3532cd2740d411a55b403996eedf4ba461b22b6b7a186ac539a93cd64727d63'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250521/terraform_1.13.0-alpha20250521_darwin_arm64.zip'
    sha256 '9049dec219d0c4fef35903a05b64e7036f6a4314e68a453406ed77c28c149bd9'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250521/terraform_1.13.0-alpha20250521_linux_amd64.zip'
    sha256 'e6f7304a2fe83edb48d41afa78ab21f3f2a12c405c5181087e8a5088667a3ba5'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250521/terraform_1.13.0-alpha20250521_linux_arm.zip'
    sha256 '42a71c1d8739663be4377f19c557def07f53a9dd79b1bbafcd03e97cc51bcc86'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250521/terraform_1.13.0-alpha20250521_linux_arm64.zip'
    sha256 'ccda4f78d408b180a8a82902511f7677310306bda2addcba9d6bc80033140c8b'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
