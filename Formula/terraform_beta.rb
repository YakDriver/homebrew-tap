# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.15.0-beta2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta2/terraform_1.15.0-beta2_darwin_amd64.zip'
    sha256 '0f09c3703358520a5ae24385708d3c3029ec1169ff9c04bb150b7198ac07e6a4'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta2/terraform_1.15.0-beta2_darwin_arm64.zip'
    sha256 'e4bb2df7795788051f7089932f27e16f2379fddcd802450cdfecae0cf954192f'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta2/terraform_1.15.0-beta2_linux_amd64.zip'
    sha256 '843459a79b8f9f95a1fe0492e18f19e18ca76c5f43fd8efaed0a1560d215df85'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta2/terraform_1.15.0-beta2_linux_arm.zip'
    sha256 'e6772d03bcb3fd3203974d7566df046f31341c850afe17ab523cad596db34e9b'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.15.0-beta2/terraform_1.15.0-beta2_linux_arm64.zip'
    sha256 'd625af2b0be899479fc81c1c6d45af96cf412c920e6adc5ae062a8b78acb5b14'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
