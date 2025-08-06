# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.13.0-rc1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-rc1/terraform_1.13.0-rc1_darwin_amd64.zip'
    sha256 '946b03b24b58e035bf486e96cba7c5df57e74f7597b3b21f3efb6891ef73e1a7'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.13.0-rc1/terraform_1.13.0-rc1_darwin_arm64.zip'
    sha256 '003efae168bf87c9dec1f77a7f53be7af17aa009ac58bd4f160a90468bfc08c2'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.13.0-rc1/terraform_1.13.0-rc1_linux_amd64.zip'
    sha256 '76cbad46a5ad227773a58d68273bfb7fa4ebe3175e573ed9578bf16a78b2be57'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-rc1/terraform_1.13.0-rc1_linux_arm.zip'
    sha256 '1d7c16eaf643ed2452054e66b097f252c4b67fc4edcc523cd7ac9359e076455f'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.13.0-rc1/terraform_1.13.0-rc1_linux_arm64.zip'
    sha256 '2d2746773af080cadd40f073c4060e435e78d1e1d0c2ffc902e6c56f9518609d'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
