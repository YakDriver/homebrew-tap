# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.11.0-beta1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta1/terraform_1.11.0-beta1_darwin_amd64.zip'
    sha256 '9704b2159bd5df6f880f527a4b4d43079fd682b7681a061f48ab008c026d2027'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta1/terraform_1.11.0-beta1_darwin_arm64.zip'
    sha256 'aa44c7030be116974f1403981a9f05dc2255b7110dd3503c775188f9506fc236'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta1/terraform_1.11.0-beta1_linux_amd64.zip'
    sha256 'b556510af5051d68fe2f5f5e904c78de4920c1d50f017b3b0a8dddf1fb0c9982'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta1/terraform_1.11.0-beta1_linux_arm.zip'
    sha256 '7690db6545ad957e55fb3236854a5e0c91353faf29cd118664a04f6a572542a3'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-beta1/terraform_1.11.0-beta1_linux_arm64.zip'
    sha256 'fe673ce079f765d9f78410a69e7e83b117497abd7fda0282fa2d671dd2975d27'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
