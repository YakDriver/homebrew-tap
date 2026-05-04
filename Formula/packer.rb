# frozen_string_literal: true

# Packer is a tool for creating identical machine images for multiple platforms from a single source configuration.
# It automates the creation of machine images, allowing you to build and deploy infrastructure more efficiently.
# This formula installs the latest alpha version of the Packer CLI tool.
class Packer < Formula
  desc 'Packer'
  homepage 'https://www.packerproject.io/'
  version '1.15.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.15.3/packer_1.15.3_darwin_amd64.zip'
    sha256 '7718bee4a580d7c486263f10a28d00db7e8c600af08102ae118592ee30a50892'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/packer/1.15.3/packer_1.15.3_darwin_arm64.zip'
    sha256 'cca1601f2d187b084aa875183ae70e85521df0475fc0f61a7380e46df8980289'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.15.3/packer_1.15.3_linux_amd64.zip'
    sha256 '9ed712c9a8f223c7985d7d21c6b65744bf1c66b8aca333232b96f5ae3fd9c90d'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.15.3/packer_1.15.3_linux_arm.zip'
    sha256 'ced0c4d91f2642affb8188459a167aafd7d62e660b59db9e7fa9bdcfdb895324'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.15.3/packer_1.15.3_linux_arm64.zip'
    sha256 'ebf06f8f30a7e3bc69fa33ac8a5dfffefd70187df4541cccc6ef3f325b8ae4f1'
  end

  conflicts_with 'packer'

  def install
    bin.install 'packer'
  end

  test do
    system "#{bin}/packer --version"
  end
end
