# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.12.0-rc2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc2/terraform_1.12.0-rc2_darwin_amd64.zip'
    sha256 '4bfd8810fb355fd86fba45aae73def8670c5cba99136199079b95777de406422'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc2/terraform_1.12.0-rc2_darwin_arm64.zip'
    sha256 '2f760705eb7cd82de4b472cdb2f5933eefb7f8a1ade131dae2b09566620ff3f6'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc2/terraform_1.12.0-rc2_linux_amd64.zip'
    sha256 '19d44da58e521282836d9e817faf77aef4e668d268bb71dbce9e24f9f5ead906'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc2/terraform_1.12.0-rc2_linux_arm.zip'
    sha256 '56ab93c177dcf41ee08e5842000a5cdc9df99177bd594a995dd0f7531c8fae90'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.12.0-rc2/terraform_1.12.0-rc2_linux_arm64.zip'
    sha256 'a158de38e66a88713ff07a3f7640ae418b81f20e66ef9a27fc6d301473ea0915'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
