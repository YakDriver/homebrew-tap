# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.12.0-alpha20250213'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250213/terraform_1.12.0-alpha20250213_darwin_amd64.zip'
    sha256 '2ea2d8b8e15c0c2393d3610ddd678410db1a1d272b61222b63c63c4700bfc980'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250213/terraform_1.12.0-alpha20250213_darwin_arm64.zip'
    sha256 'dae3f356930a342b5da5bd5b110eab80533e165bd01aad43c69956de3b2ca561'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250213/terraform_1.12.0-alpha20250213_linux_amd64.zip'
    sha256 '431fabdcd5ff5bc978c65afdb2d215c128f81d4adbe6ed2d2b085145b611a0d7'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250213/terraform_1.12.0-alpha20250213_linux_arm.zip'
    sha256 'c34822e7272d360cdaa422867c198b57730ace16334f1ef66f8821aa6066f41b'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-alpha20250213/terraform_1.12.0-alpha20250213_linux_arm64.zip'
    sha256 'fae1dcc7c2140857c0a2f6544600a92e0171c53b36b41db12c401497be9d691d'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
