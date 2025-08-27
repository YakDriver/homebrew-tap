# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.14.0-alpha20250827'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250827/terraform_1.14.0-alpha20250827_darwin_amd64.zip'
    sha256 '4295c1a47ca5baf1fb142bb33500f159d7912d6366cbad7d0618180c98872bd7'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250827/terraform_1.14.0-alpha20250827_darwin_arm64.zip'
    sha256 '4b8eba3e76f6636d7414f73d24e8050e269f88605d7d76276d5940a1cd591ee6'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250827/terraform_1.14.0-alpha20250827_linux_amd64.zip'
    sha256 'ee8877e7e43ba884a63d934b5ff1d69a5eba2bf3d84115fd74e0bade5ab196f1'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250827/terraform_1.14.0-alpha20250827_linux_arm.zip'
    sha256 '55a7e6f14522ea3a08a1bc563bd553d0134985310df1118a5aef45ddcc23f310'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250827/terraform_1.14.0-alpha20250827_linux_arm64.zip'
    sha256 'd7b1de06e9557ab71d8ea5701c8b77ddf888b6ff15b8327af8c352fd57f177db'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
