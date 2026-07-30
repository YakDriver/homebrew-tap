# frozen_string_literal: true

# Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.
# It can manage existing and popular service providers as well as custom in-house solutions.
# This formula installs the absolute latest version of Terraform, which may be alpha, beta, rc, or stable.
# WARNING: This may install pre-release versions with breaking changes. Use at your own risk.
class TerraformLatest < Formula
  desc 'Terraform Absolute Latest (may be alpha/beta/rc/stable)'
  homepage 'https://www.terraform.io/'
  version '1.17.0-alpha20260729'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260729/terraform_1.17.0-alpha20260729_darwin_amd64.zip'
    sha256 'f4191486f47807a3e913c9c6689722d7d09d230958d36bd84c5ff3178dcc8a0c'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260729/terraform_1.17.0-alpha20260729_darwin_arm64.zip'
    sha256 '127c3ae62d38346c7403218e6f5548aaa2f7983195ef5c653f2aacb3047e6572'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260729/terraform_1.17.0-alpha20260729_linux_amd64.zip'
    sha256 '3226115f13cc5352db775a035909746c183e861e394001064c57bd439df71c83'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260729/terraform_1.17.0-alpha20260729_linux_arm.zip'
    sha256 '82acfc929cb789692e3eb62098b41a3c7523b6d80670eb9ad971b476929b59ce'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/terraform/1.17.0-alpha20260729/terraform_1.17.0-alpha20260729_linux_arm64.zip'
    sha256 '2214a898ae97201c40932e783e7f38f955a116262aa6fa635667c91d1c204fdf'
  end

  conflicts_with 'terraform'

  def install
    bin.install 'terraform'
  end

  test do
    system "#{bin}/terraform --version"
  end
end
