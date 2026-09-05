# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.17.0-alpha20260827'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260827/terraform_1.17.0-alpha20260827_darwin_amd64.zip'
    sha256 '9062133eb405a9f90967d904f0255438019bc690d1229cabf125479dd5606ff0'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260827/terraform_1.17.0-alpha20260827_darwin_arm64.zip'
    sha256 'b6c684678e862da85ade584887787137268175b3f202aec19e1bd5cc93130b0f'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260827/terraform_1.17.0-alpha20260827_linux_amd64.zip'
    sha256 '9ee3d410580dbccb816fc94238b7633bf33b2e6ee978579b39092518cab2ec7a'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260827/terraform_1.17.0-alpha20260827_linux_arm.zip'
    sha256 '3086493e98c11218836fdb410fc08e9834c32b09dc1633a200cc366858e0bc1c'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260827/terraform_1.17.0-alpha20260827_linux_arm64.zip'
    sha256 'f7af10a118e0f6f46907fab32e0383878d3ed9c94067efa229dda50cf8b7189f'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
