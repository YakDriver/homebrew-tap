# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.11.0-alpha20241218'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241218/terraform_1.11.0-alpha20241218_darwin_amd64.zip'
    sha256 '16904b8762b044f247d10922373de54d65ebe2f9cb5735bf45f6079775bcbdbe'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241218/terraform_1.11.0-alpha20241218_darwin_arm64.zip'
    sha256 'b9f1fbc9796dc8c593f9d3fb741c373d4ecb405b30a707a01e1084d0482bc51f'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241218/terraform_1.11.0-alpha20241218_linux_amd64.zip'
    sha256 '9a0742f6d73e11403c9123c1306891f3f15ae2e7e6a7c1cd64e1988edd59fe97'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241218/terraform_1.11.0-alpha20241218_linux_arm.zip'
    sha256 '7f5aefc4c0b3c1c882abc3263e5d25b75d151e11bf79961efbed1aa6799173cb'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241218/terraform_1.11.0-alpha20241218_linux_arm64.zip'
    sha256 '40c3f658ca3c0273bc42049eb80b776741cba89df5fc3d5fe5fe95095e472ddf'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
