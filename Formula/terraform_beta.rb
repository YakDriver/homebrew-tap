# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.13.0-beta1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta1/terraform_1.13.0-beta1_darwin_amd64.zip'
    sha256 'ce9f78e02a35cd92758c93d11f8c48dcebfe0cb23c8084804690fb6e3336dff9'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta1/terraform_1.13.0-beta1_darwin_arm64.zip'
    sha256 'cb6c8efe7e01e5350233c39f4a16054a19e2e77435c27971db41f9c36ab2367c'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta1/terraform_1.13.0-beta1_linux_amd64.zip'
    sha256 '661c6647b82a0a357ec8166822a9bee06ef778612e19102318ecdb04552df4e8'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta1/terraform_1.13.0-beta1_linux_arm.zip'
    sha256 '06fb926c789696746aeeb3e1b73928da23cc42d2b892d60cb0df658d4b526635'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta1/terraform_1.13.0-beta1_linux_arm64.zip'
    sha256 'ae484acddbb7a3dd3f6f525f74b97872719fedf48f0bee2996b01c312b35ee20'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
