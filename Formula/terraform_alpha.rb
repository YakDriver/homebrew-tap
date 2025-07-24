# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.14.0-alpha20250724'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250724/terraform_1.14.0-alpha20250724_darwin_amd64.zip'
    sha256 'ac43ec761bfef40c8db42fa9b3c5d10556637fb70a3352665c0f9c2b30240f83'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250724/terraform_1.14.0-alpha20250724_darwin_arm64.zip'
    sha256 '6bb8679844f12816f18deb90a05fc223a3e15748d2d2c94586c527aa61844633'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250724/terraform_1.14.0-alpha20250724_linux_amd64.zip'
    sha256 '7c8c93272d0b9b9e3bcd1f84a683f885bf7d3ce74945fa2b924f94703d7d2077'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250724/terraform_1.14.0-alpha20250724_linux_arm.zip'
    sha256 'f808dba4b4000ee1f773f0a764271f18912be3d388734dceee58c3bfe3d82e36'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250724/terraform_1.14.0-alpha20250724_linux_arm64.zip'
    sha256 '75e2b9e83531947ebd522a27f04060e806859f6753a9361ed0dead2c10088057'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
