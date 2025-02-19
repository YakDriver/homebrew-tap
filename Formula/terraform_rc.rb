# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the latest beta version of the Terraform CLI tool.
class TerraformBeta < Formula
  desc 'Terraform Latest Beta'
  homepage 'https://www.terraform.io/'
  version '1.11.0-rc2'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc2/terraform_1.11.0-rc2_darwin_amd64.zip'
    sha256 'a463bd27c7864a2e9fd48e2a748d153d4be82e331df72fa03f150a7998445675'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc2/terraform_1.11.0-rc2_darwin_arm64.zip'
    sha256 '72256f71ab0530fa2e8fdc18dbe0cad37c9e40695ed1894ba68d43ac24b8cf04'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc2/terraform_1.11.0-rc2_linux_amd64.zip'
    sha256 '6d65e87401a5afbb1424404f40f80db6f4aa1a0d2747a3461c249d629f34b9d9'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc2/terraform_1.11.0-rc2_linux_arm.zip'
    sha256 'f45941722f9ebd993f961f32c95c8e7c4c4de674d53de8ac8010c75302fb5370'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.11.0-rc2/terraform_1.11.0-rc2_linux_arm64.zip'
    sha256 '9e28c1d897dca34863570c214ebcd41f237f6f56632a90369369c6009388154d'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
