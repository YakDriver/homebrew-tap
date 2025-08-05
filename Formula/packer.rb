# frozen_string_literal: true

# Packer is a tool for creating identical machine images for multiple platforms from a single source configuration.
# It automates the creation of machine images, allowing you to build and deploy infrastructure more efficiently.
# This formula installs the latest alpha version of the Packer CLI tool.
class Packer < Formula
  desc 'Packer'
  homepage 'https://www.packerproject.io/'
  version '1.14.1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.14.1/packer_1.14.1_darwin_amd64.zip'
    sha256 '2007fecc728188217fde61d732b59cd8a58f92c5a70127dd69415213d4ebd733'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/packer/1.14.1/packer_1.14.1_darwin_arm64.zip'
    sha256 'f3fc31635f07d9d10e70b746f1ef9e8f53095e78add90655c6458b9ac3061048'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.14.1/packer_1.14.1_linux_amd64.zip'
    sha256 'b9c39b150fd856c6a6ab1639acc01a181d85033f4e0dc6c9ef87bbb692a59c31'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.14.1/packer_1.14.1_linux_arm.zip'
    sha256 '9f1096d89d5c8720df652195a14e7ccdf110dba0b139361f0c57fdfc81cf40b1'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.14.1/packer_1.14.1_linux_arm64.zip'
    sha256 'b640f5db43ab4c4ad5060cf9144fb3a9461ef56e7fd3368fc39c66eab5a2247e'
  end

  conflicts_with 'packer'

  def install
    bin.install 'packer'
  end

  test do
    system "#{bin}/packer --version"
  end
end
