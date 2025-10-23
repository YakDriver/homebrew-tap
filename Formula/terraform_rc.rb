# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.14.0-rc1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc1/terraform_1.14.0-rc1_darwin_amd64.zip'
    sha256 '0ab45a70bce931e242157984de64fa5197efe7166a56f4cc38714821756e38f4'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc1/terraform_1.14.0-rc1_darwin_arm64.zip'
    sha256 '27c9c2148e5536e19863952d495648e3e9757c1fa396d9553da56091683a0363'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc1/terraform_1.14.0-rc1_linux_amd64.zip'
    sha256 '65b4666453979cc0c053c12250d08f7fd92d3b9920c775ff3471c697d1ca9b76'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc1/terraform_1.14.0-rc1_linux_arm.zip'
    sha256 '5ef6a6bc69987d377f5161d10112d269f368f3c53fb1cc7c1c8a94c14ed9ef19'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-rc1/terraform_1.14.0-rc1_linux_arm64.zip'
    sha256 '5857619f57222faef2eea2bf1a3b8e8c6fa43d552ba415fbf2c5248aa868140e'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
