# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.13.0-beta2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta2/terraform_1.13.0-beta2_darwin_amd64.zip'
    sha256 'd1e205a68f542cc8462614ca3d6a2982547f27660fbef4f21d97d15b9c9d023b'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta2/terraform_1.13.0-beta2_darwin_arm64.zip'
    sha256 '01057204799b93acdab5a33c34087f9e974c4b36532f6ee570e008edf45231e2'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta2/terraform_1.13.0-beta2_linux_amd64.zip'
    sha256 'fb37c17eb502040595a5f976c9acaee9a8d6755f7e98969f432571da31b95de7'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta2/terraform_1.13.0-beta2_linux_arm.zip'
    sha256 'abc8570eb9a06eb5811b1c184649fd547e8e43370fa895239f9e8b293177763a'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta2/terraform_1.13.0-beta2_linux_arm64.zip'
    sha256 'd517846d2b5deb0766bd7e0107dbad9abd0991480817a9d7be3e7abe81c6b5b3'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
