# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.14.0-beta1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta1/terraform_1.14.0-beta1_darwin_amd64.zip'
    sha256 '2804c31643de5e02739c281732b7e37bb08a1e555b2bbd5853b2437891130f22'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta1/terraform_1.14.0-beta1_darwin_arm64.zip'
    sha256 'd542b3d0e3107a29c7b590941a731782c81466044c91eeb7193fa217065ea1d5'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta1/terraform_1.14.0-beta1_linux_amd64.zip'
    sha256 '92d705af5813cbf114f85e1d8f545124bbe7053bcd502d080d431eca969393e8'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta1/terraform_1.14.0-beta1_linux_arm.zip'
    sha256 'ffbfb01e0d312d18045cb467e9ccdad7835eae96624b96ea951191efc9b3dcf2'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta1/terraform_1.14.0-beta1_linux_arm64.zip'
    sha256 'f69d78e9688fa1a1dcbd5d4932dc6fba9aacfd6bb64d8f52939c572a998e9875'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
