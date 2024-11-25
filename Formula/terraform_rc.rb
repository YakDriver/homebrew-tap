# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.10.0-rc3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc3/terraform_1.10.0-rc3_darwin_amd64.zip'
    sha256 'f8331ee9e37a958e3922573f98d8eb04205afe64a5570b098e83f279df69eb1d'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc3/terraform_1.10.0-rc3_darwin_arm64.zip'
    sha256 'e03fb9184832592a773e7a352d6f326a5cd093e54212a17feed0d6eb6ad65a46'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc3/terraform_1.10.0-rc3_linux_amd64.zip'
    sha256 'a3abb303915638e6864793e3e717966e95f3358cdcdde7db15dae67e391c5d8e'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc3/terraform_1.10.0-rc3_linux_arm.zip'
    sha256 '334df292c6919da6d68e9c645f454ecbaf9f0df9c12a863f1934a51b2f762a61'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc3/terraform_1.10.0-rc3_linux_arm64.zip'
    sha256 '171eecb699aa004b138dcbf66c8d31da5c969613fb04e2ea79a25685ea01b2df'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
