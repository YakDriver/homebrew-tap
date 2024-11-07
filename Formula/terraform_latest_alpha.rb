# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformLatestAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version 'terraform_1.10.0-alpha20241023'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/terraform_1.10.0-alpha20241023/terraform_terraform_1.10.0-alpha20241023_darwin_amd64.zip'
    sha256 '8856e69a835ae24ec0003114cbecd15d3dad98d2156d1b5ea68fe4ceb597ef4c'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/terraform_1.10.0-alpha20241023/terraform_terraform_1.10.0-alpha20241023_darwin_arm64.zip'
    sha256 'ff0558ae0401d2702a6b3e890edc1f22529bba77d3e59087b2f508943e3814eb'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/terraform_1.10.0-alpha20241023/terraform_terraform_1.10.0-alpha20241023_linux_amd64.zip'
    sha256 '6dd62072251cb7bcc5463854b1828c3116b07e00d60d4a70b9358d26e415ae07'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/terraform_1.10.0-alpha20241023/terraform_terraform_1.10.0-alpha20241023_linux_arm.zip'
    sha256 'd9adc9cc675609be7ea00c46274a3c14b27933d90d66df0acac50727714ce5f0'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/terraform_1.10.0-alpha20241023/terraform_terraform_1.10.0-alpha20241023_linux_arm64.zip'
    sha256 '642c930b98b1bc458ff3a167e5972c21ca6507b5fad9e2383dd9756cd0be8319'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
