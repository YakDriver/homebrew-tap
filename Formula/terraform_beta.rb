# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.14.0-beta2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta2/terraform_1.14.0-beta2_darwin_amd64.zip'
    sha256 'fed6bb3c67383b4385a1b8f310ffee5f49ad06ce9b96894c48bb6e0ec868c75a'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta2/terraform_1.14.0-beta2_darwin_arm64.zip'
    sha256 '748b1c73e8b4acb65d48e5401a8609eb16054faab558b55677c155ca6a798445'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta2/terraform_1.14.0-beta2_linux_amd64.zip'
    sha256 '2b1734cbc76fbbdcefacd33b519dd47041c7d5d5e0edabe92bc5176a34ba4960'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta2/terraform_1.14.0-beta2_linux_arm.zip'
    sha256 '5bd238a2ca7554a22d67408c9188990438ff0358d03f9062a49acf2aa47fb53e'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-beta2/terraform_1.14.0-beta2_linux_arm64.zip'
    sha256 '71206d24e97da10286686fe87a02c19b09b9912132b4a1c036528b06ff68f8ab'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
