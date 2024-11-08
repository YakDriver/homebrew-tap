# frozen_string_literal: true

# Packer is a tool for creating identical machine images for multiple platforms from a single source configuration.
# It automates the creation of machine images, allowing you to build and deploy infrastructure more efficiently.
# This formula installs the latest beta version of the Packer CLI tool.
class PackerBeta < Formula
  desc 'Packer Latest Beta'
  homepage 'https://www.packerproject.io/'
  version '1.11.0-beta'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.11.0-beta/packer_1.11.0-beta_darwin_amd64.zip'
    sha256 'b4183e2b795ef862cdd447dc727bb50963442e299f64bb8aaf55edc505ebf9cc'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/packer/1.11.0-beta/packer_1.11.0-beta_darwin_arm64.zip'
    sha256 'e8bac71d663ca1a785050d7b77b0f7f686f32c8ca2a97d04c48790d69a2f5399'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/packer/1.11.0-beta/packer_1.11.0-beta_linux_amd64.zip'
    sha256 '40c4f7baed9de21db350d33258d4616eff074a0f05ae02fcfaa8c16eb3dca5f0'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.11.0-beta/packer_1.11.0-beta_linux_arm.zip'
    sha256 '1a59d23f2798a8bd8b8298f4786e276bdfbe9159515d6b0f1390530ac01b8c50'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/packer/1.11.0-beta/packer_1.11.0-beta_linux_arm64.zip'
    sha256 '801482e0cb0be13c35a9c09ae0a785e57514b7ee87a547a7155a930a64b5819e'
  end

  conflicts_with 'packer'

  def install
    bin.install 'packer'
  end

  test do
    system "#{bin}/packer --version"
  end
end
