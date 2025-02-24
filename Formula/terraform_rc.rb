# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.11.0-rc3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc3/terraform_1.11.0-rc3_darwin_amd64.zip'
    sha256 '957fb41f0685925bb79fbce9d7b8602e52a3309d299f2cc33125fadd2b6095d5'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc3/terraform_1.11.0-rc3_darwin_arm64.zip'
    sha256 'd2f2010a546953e0713ce35577373249bdc20cbf30d75f15412cd5aba68d9de5'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc3/terraform_1.11.0-rc3_linux_amd64.zip'
    sha256 'b91c6fa4f1a05f7fa066b5f918263d7f0184b8306c6e0030f961dd709f5dd3c0'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc3/terraform_1.11.0-rc3_linux_arm.zip'
    sha256 '65fe1ef7af9a0dd7f5e6dc8cafd454c24fb403c4f9cca8d24539f5f3525c40b8'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc3/terraform_1.11.0-rc3_linux_arm64.zip'
    sha256 '2f115b43ca7e1b8d6ffaff59d123408b3e8c2737ae2b196ba2033a49e89be45a'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
