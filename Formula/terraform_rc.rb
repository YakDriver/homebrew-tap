# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.10.0-rc2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc2/terraform_1.10.0-rc2_darwin_amd64.zip'
    sha256 'c5c19edda419557ebd90325c7ffec0552fefb10d8234adc01413dc5150b07c01'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc2/terraform_1.10.0-rc2_darwin_arm64.zip'
    sha256 'b75a86b98e206b9d105267ab5602d7d66a7958449fcc17491999fc870e679b0e'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc2/terraform_1.10.0-rc2_linux_amd64.zip'
    sha256 'ccf6b917a89507d4c8c990774bfbac0dc97f93cdef81926a9572c1b73d168c42'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc2/terraform_1.10.0-rc2_linux_arm.zip'
    sha256 '074222d84b8b9590904b05a82174c0e313433b14acb1d16e720e3083cb59dd25'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.10.0-rc2/terraform_1.10.0-rc2_linux_arm64.zip'
    sha256 '6327d81ec9f0fa7b60b7e26fd1b64cbaff5bb63ab6b2fa8c1d3f635435be381e'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
