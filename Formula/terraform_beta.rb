# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.13.0-beta3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta3/terraform_1.13.0-beta3_darwin_amd64.zip'
    sha256 '2a5ef38d5247e28f8ac42e5efe927c42683b181c4d3be341e49fdc66549b3430'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta3/terraform_1.13.0-beta3_darwin_arm64.zip'
    sha256 '07b3d85f4b45b4f05170f689b89566802fdd52affe1db9c32d35399624faf548'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta3/terraform_1.13.0-beta3_linux_amd64.zip'
    sha256 '338e56fccc108e41164f0d35b42711b0c48a6a02527711c56ceab2a5cf25c04c'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta3/terraform_1.13.0-beta3_linux_arm.zip'
    sha256 '6bff00037fbe861c4a869050ca3e1902cb01d0f0ffefb1a8f257911e34f8511a'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-beta3/terraform_1.13.0-beta3_linux_arm64.zip'
    sha256 '58837072c4bb1410dd1e64485454d3719b95dd472b72b420b38de0fa5728c2de'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
