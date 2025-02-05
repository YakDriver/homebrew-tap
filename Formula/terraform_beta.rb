# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.11.0-beta2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta2/terraform_1.11.0-beta2_darwin_amd64.zip'
    sha256 'a556a301ca5d4274bc5ee4ca7dfb6497f93014dbdde3b893dcb805028628157a'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta2/terraform_1.11.0-beta2_darwin_arm64.zip'
    sha256 'b5f453603488e3559f33100520a0f7c1f3321a4957c6ed62c79cb4c5092c5497'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta2/terraform_1.11.0-beta2_linux_amd64.zip'
    sha256 'e7a36e6df6767c7742f8e847768a5b37a1893c8618e41b773e8cb1a4a3984a70'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta2/terraform_1.11.0-beta2_linux_arm.zip'
    sha256 'cf22ac6f77b5482effa8b8cae3886c41aa39936de0a1b7508e00143861143de0'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta2/terraform_1.11.0-beta2_linux_arm64.zip'
    sha256 'b1524fc6cc31f7c6ffee634f2ad03d5d224ddf542ae049510a20e242f9ce2a58'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
