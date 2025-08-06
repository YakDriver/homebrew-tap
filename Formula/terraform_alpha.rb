# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.14.0-alpha20250806'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250806/terraform_1.14.0-alpha20250806_darwin_amd64.zip'
    sha256 '2023cdd907f3d5b6d168b7dbedb2f9c07c9e4374e50e217e8216268c80d0c207'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250806/terraform_1.14.0-alpha20250806_darwin_arm64.zip'
    sha256 '530bd87db40aa0cc6d748b8c9c66b4b13f8009eb8e086144ee9699421d5a9ec5'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250806/terraform_1.14.0-alpha20250806_linux_amd64.zip'
    sha256 '4d9321203029cab6d4e6efe67dd0560ccad931e2d1c458b1cdadea203de75226'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250806/terraform_1.14.0-alpha20250806_linux_arm.zip'
    sha256 'c105ce0d6165aa73d76aebbe33e6e1a10aeebb3a6beb93429d0bf9a1a0f98633'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.14.0-alpha20250806/terraform_1.14.0-alpha20250806_linux_arm64.zip'
    sha256 '01dbba3e860165a746995315cde413032b43bda37d4a58b3fd5edf5a1cbee50d'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
