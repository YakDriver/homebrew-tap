# frozen_string_literal: true

# Terraform Stacks is a tool for managing and deploying infrastructure as code.
# It allows you to define, provision, and manage infrastructure across multiple cloud providers.
# This formula installs the latest stable version of the Terraform Stacks CLI tool.
class Tfstacks < Formula
  desc 'Terraform Stacks'
  homepage 'https://www.terraform.io/'
  version '1.2.1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tfstacks/1.2.1/tfstacks_1.2.1_darwin_amd64.zip'
    sha256 'c7526358e6904e9a1e59c92f1c3642732339f31fd41946d8f4ca5dcee7277b2d'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/tfstacks/1.2.1/tfstacks_1.2.1_darwin_arm64.zip'
    sha256 '9ed2b7f74b15b676120c12c2277a3017f6e1c5522ebd7085a6c4b5c49b984edb'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tfstacks/1.2.1/tfstacks_1.2.1_linux_amd64.zip'
    sha256 '0e5988f5d5749c30dc62e4819650bc1bb2dbb9d30dff17504e9b46fb8c6e50c1'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tfstacks/1.2.1/tfstacks_1.2.1_linux_arm.zip'
    sha256 'a3cfc85018930c7ede98ae7c452fe24f1d84ae7d1d94a631e3783cf1a076568a'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tfstacks/1.2.1/tfstacks_1.2.1_linux_arm64.zip'
    sha256 '38b1bde23e69bfe2374986fb5f59708ff17de051a883f64628769bf4040e26d0'
  end

  conflicts_with 'tfstacks'

  def install
    bin.install 'tfstacks'
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
