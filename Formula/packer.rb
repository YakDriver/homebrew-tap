# frozen_string_literal: true

# Packer is a tool for creating identical machine images for multiple platforms from a single source configuration.
# It automates the creation of machine images, allowing you to build and deploy infrastructure more efficiently.
# This formula installs the latest alpha version of the Packer CLI tool.
class Packer < Formula
  desc 'Packer'
  homepage 'https://www.packerproject.io/'
  version '1.14.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.14.3/packer_1.14.3_darwin_amd64.zip'
    sha256 'f76d02dd10d4ded95ba9b970254820d1b081e7d5720e122fd815ab01e80eb6d0'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/packer/1.14.3/packer_1.14.3_darwin_arm64.zip'
    sha256 'e50aec4714a907db4b8fd7c1a8c92075b8dd801cac420fbd98d0d0e1470a68fe'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.14.3/packer_1.14.3_linux_amd64.zip'
    sha256 '95041cc0a30f05d5583be26a7c0b715f488e461418ce0c5d88ba204cb092bef1'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.14.3/packer_1.14.3_linux_arm.zip'
    sha256 '0676cbfb8f3a666c8b3c38e4f5d58db54e5ee70ebd7baf725df7f0cea2bb6fd9'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.14.3/packer_1.14.3_linux_arm64.zip'
    sha256 '42d920291ff495702004eb941b56143dc3efd9b66743fd949b19156422029847'
  end

  conflicts_with 'packer'

  def install
    bin.install 'packer'
  end

  test do
    system "#{bin}/packer --version"
  end
end
