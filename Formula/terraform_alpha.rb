# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.13.0-alpha20250708'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250708/terraform_1.13.0-alpha20250708_darwin_amd64.zip'
    sha256 'f38d7f75c94c251b1030d64624e2db9509f96e492d56a78e5c7f0ded43caf2c4'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250708/terraform_1.13.0-alpha20250708_darwin_arm64.zip'
    sha256 '4eb9705bd0443a5c6afbe600ad5c70410607eadb306ae67c06d635bedd08d413'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250708/terraform_1.13.0-alpha20250708_linux_amd64.zip'
    sha256 'd186ed4d55f2f6157157de7c2f5ea964511ceeb6135a64c695e30cc0c6597df2'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250708/terraform_1.13.0-alpha20250708_linux_arm.zip'
    sha256 '7f22d1208aaf17cc384b6a2d4d1c72678ba27fa3d38c971d939be0926d24f6d2'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-alpha20250708/terraform_1.13.0-alpha20250708_linux_arm64.zip'
    sha256 '00a2f2e874edb8b0433d7f2174da97bf5fce0898882cef47579a7a7fb7009143'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
