# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.16.0-beta1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta1/terraform_1.16.0-beta1_darwin_amd64.zip'
    sha256 'e59e577910881197ffacb0fee072cb594ddd19ae09a4f0aafb3f5c71d5b67e0f'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta1/terraform_1.16.0-beta1_darwin_arm64.zip'
    sha256 'be2b8178d2179bfbb61ca2794cbdc0863359544e6e9f4adf07b1dc7b58c414c1'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta1/terraform_1.16.0-beta1_linux_amd64.zip'
    sha256 '3dac0967fffde50d8c863db4625287b467159e2fea8f21cd27c44752efa49b90'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta1/terraform_1.16.0-beta1_linux_arm.zip'
    sha256 'e007fbaad095e1ea11ca879a362ca58da6d40bd4d292fc83e5ae1852a28c620c'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.16.0-beta1/terraform_1.16.0-beta1_linux_arm64.zip'
    sha256 '0c9533d9cb6f81b0d4b6aeeebdfebcdaac13f2c3c7e4f00b0759a868a6ec2e5c'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
