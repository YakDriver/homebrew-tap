# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.15.0-alpha20251203'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20251203/terraform_1.15.0-alpha20251203_darwin_amd64.zip'
    sha256 'd890d8ce6a5b91f3c0ac6d7b64df79ad9eb568e6c6e8b9781152874295de9642'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20251203/terraform_1.15.0-alpha20251203_darwin_arm64.zip'
    sha256 'dec9d663ca4395e3993cdf73e571df1f4f1899348988bef8d20042ab62841b78'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20251203/terraform_1.15.0-alpha20251203_linux_amd64.zip'
    sha256 '3bb61846ba8ffa4c19c13fa1a12c15f57ec2697d540f4a36caafe6210e60b650'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20251203/terraform_1.15.0-alpha20251203_linux_arm.zip'
    sha256 '499486077518ff1b61de587d4c06f7db6e2aea29e4f459540ac40f7faec36491'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-alpha20251203/terraform_1.15.0-alpha20251203_linux_arm64.zip'
    sha256 'bb525ff69cf59d3ffacf2cb972a6daf843e2e9619e2713f50abd3bb92dfce9a3'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
