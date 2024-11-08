# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest alpha version of the Terraform CLI tool.
class TerraformAlpha < Formula
  desc 'Terraform Latest Alpha'
  homepage 'https://www.terraform.io/'
  version '1.11.0-alpha20241106'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241106/terraform_1.11.0-alpha20241106_darwin_amd64.zip'
    sha256 '6e6a549cb32bed43b9d117a282874b804966d8678c54164c84f09190fb9a0a01'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241106/terraform_1.11.0-alpha20241106_darwin_arm64.zip'
    sha256 '907c73155243390e9cbbe0ac94b81d5bde7fb40a822c554468b5f56eedcc96b8'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241106/terraform_1.11.0-alpha20241106_linux_amd64.zip'
    sha256 '09622da130f070a2754c8a9424f2601245b1c5efac58a25db56bbb3f1e5ab1b8'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241106/terraform_1.11.0-alpha20241106_linux_arm.zip'
    sha256 '425ff2a6c4cbcf85d2fa0fe5211558a39f798430ed938ade49d08925e2817881'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-alpha20241106/terraform_1.11.0-alpha20241106_linux_arm64.zip'
    sha256 'ded1f4ab15c20b894f770ac80699a81318f101c1aeed307e94ca245293f51dcc'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
