# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.15.0-rc4'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-rc4/terraform_1.15.0-rc4_darwin_amd64.zip'
    sha256 '668bac06086805fe0df3ff46b48b2b2f4c0929acf528a2268fadebd8f63637d0'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.15.0-rc4/terraform_1.15.0-rc4_darwin_arm64.zip'
    sha256 'e955c06e59a0b2ce5d549099a448828c7cb3b5d77ba0a0794b17382360db0206'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-rc4/terraform_1.15.0-rc4_linux_amd64.zip'
    sha256 '30652942ebec9e2270c8ba201a9ca1d45d4d18feaa58c9c7738a6dba2bd885a9'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-rc4/terraform_1.15.0-rc4_linux_arm.zip'
    sha256 '718c89dcd2af591b567c29dacf5cb524408ee8d685c2e24927df63f5d23aabea'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-rc4/terraform_1.15.0-rc4_linux_arm64.zip'
    sha256 'ccc32443344064b72da31be24e7b9af63f112002be872751bf9763e7cfa1b491'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
