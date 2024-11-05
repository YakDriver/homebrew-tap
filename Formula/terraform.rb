class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_darwin_amd64.zip"
    sha256 "66e69b5580907254f8bcb2b5cbec8c2f192ba076fcc7e4a14d9545d7c105c30d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_darwin_arm64.zip"
    sha256 "627dca78609e049ecee78b3e4c19a2c0e9dcc5a7c2b5538b60e7d3546bcf1423"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_amd64.zip"
    sha256 "ec1e72dd60b3e327c7bdc5df3c8d1c6d86f953321751113e89536d73ce2b837f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_arm.zip"
    sha256 "ac519ed9d6a967d2b839017d99c06aa5a0589ac6f658137e33f8b2385a878e20"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_arm64.zip"
    sha256 "fe24716609db030b639ff8e1728271084394de57ba010d159fba732f347c2d39"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
