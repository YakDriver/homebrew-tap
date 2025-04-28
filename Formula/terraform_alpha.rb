# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.12.0-alpha20250319'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250319/terraform_1.12.0-alpha20250319_darwin_amd64.zip'
    sha256 '4ce710db2bd8bdf2ff1cf2d1ba8eedc0b32dabc192a8bbd8c5327b84eac69382'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250319/terraform_1.12.0-alpha20250319_darwin_arm64.zip'
    sha256 'e3bc64ae3f11b0a0a695d5cd1cc4c84ca226b808c260227e5f9e127ad139507c'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250319/terraform_1.12.0-alpha20250319_linux_amd64.zip'
    sha256 'f06f39ed284c63114a689b12f24aea5ed1c2d635ba13eb352a31f60013151aaf'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250319/terraform_1.12.0-alpha20250319_linux_arm.zip'
    sha256 '4759a75d7459d33aaaaaf67f8c828e4059d6758f8b35240c144b8c06aa6478c0'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250319/terraform_1.12.0-alpha20250319_linux_arm64.zip'
    sha256 '4134f5018932cc328333e951f3512f9eaf8eb02ee72e4159a5db87a23f2882e3'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
