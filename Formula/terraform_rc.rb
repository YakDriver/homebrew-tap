# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.11.0-rc1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc1/terraform_1.11.0-rc1_darwin_amd64.zip'
    sha256 '73085f30f6a2b36d43751de5614d5e635b0f1af6fa0341baacfac7a08bf4783b'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc1/terraform_1.11.0-rc1_darwin_arm64.zip'
    sha256 '90612ac98a2ada9848f50506cee7148aa648c3304eaa1467af6b411fef70a721'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc1/terraform_1.11.0-rc1_linux_amd64.zip'
    sha256 '90a740514846c02c8ea4ceacce83d36089e86cf17b1807a29cf98bf1e89fd017'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc1/terraform_1.11.0-rc1_linux_arm.zip'
    sha256 '2e8e9d20b91f5b995abc2b00762ac41e197415c598543b6d0fa18459372271ac'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc1/terraform_1.11.0-rc1_linux_arm64.zip'
    sha256 '68ba5b90aeb8ee86b00ef63ab87a550a7fab46e0f834b9803425bf3d29e00054'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
