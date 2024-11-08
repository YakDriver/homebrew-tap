# frozen_string_literal: true

# Packer is a tool for creating identical machine images for multiple platforms from a single source configuration.
# It automates the creation of machine images, allowing you to build and deploy infrastructure more efficiently.
# This formula installs the latest alpha version of the Packer CLI tool.
class PackerAlpha < Formula
  desc 'Packer Latest Alpha'
  homepage 'https://www.packerproject.io/'
  version '1.12.0-alpha1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.12.0-alpha1/packer_1.12.0-alpha1_darwin_amd64.zip'
    sha256 '4679a05b54af9b469f227127a2add1c0ee80192cf3a1fa751e429407c7305f01'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/packer/1.12.0-alpha1/packer_1.12.0-alpha1_darwin_arm64.zip'
    sha256 'e4302f96bc52b7b647c3480ee7323f6a651ddd9c3e476680cfa639e0595ccd82'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.12.0-alpha1/packer_1.12.0-alpha1_linux_amd64.zip'
    sha256 'ff47945f6c17bdd9280ffc7d42108ab7eecc5486818e3aed8e91077c8482ca7f'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.12.0-alpha1/packer_1.12.0-alpha1_linux_arm.zip'
    sha256 'e9e4f037306ac6b873cdfa184e91ea473c144a50dc29ebc49025918cc30b4a3c'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.12.0-alpha1/packer_1.12.0-alpha1_linux_arm64.zip'
    sha256 'f3b561b6dc4d7456538ad3310763f8e70421c496e5666abfc85fd7e365210fe5'
  end

  conflicts_with 'packer'

  def install
    bin.install 'packer'
  end

  test do
    system "#{bin}/packer --version"
  end
end
