# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.11.0-alpha20250107'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20250107/terraform_1.11.0-alpha20250107_darwin_amd64.zip'
    sha256 '38ca7cc1b91699f16ba4bb331b65f3214626c358259217e718bc86bdac34ca9c'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20250107/terraform_1.11.0-alpha20250107_darwin_arm64.zip'
    sha256 '3d6527c0dcec2d5de0fefc708897ff38fbd4a23379822f8cd085a631cd997f6b'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20250107/terraform_1.11.0-alpha20250107_linux_amd64.zip'
    sha256 '94a216a409b64809e02d4009eb42b8b4468ad4e0c683d1aa3e51849a27448ca1'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20250107/terraform_1.11.0-alpha20250107_linux_arm.zip'
    sha256 '227b5e20762d92fa85bb11a0e5388342707dfb3aaa99d40d75f86971d19de308'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20250107/terraform_1.11.0-alpha20250107_linux_arm64.zip'
    sha256 '12ae6770fe4859f09e89c4914d81f62c407252cbc13c798d725a950f5fe160c5'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
