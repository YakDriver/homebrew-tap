class TerraformLatestAlpha < Formula
  desc "Terraform Latest Alpha"
  homepage "https://www.terraform.io/"
  version "1.10.0-alpha20241023"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.0-alpha20241023/terraform_1.10.0-alpha20241023_darwin_amd64.zip"
    sha256 "620b9be1be9e207d03a1df89fe90663665651d431b643ba73bb6a2fb542821dc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.10.0-alpha20241023/terraform_1.10.0-alpha20241023_darwin_arm64.zip"
    sha256 "a07b1a120439d2f93f079d95a6570ece50bb3fef729a238857c654dcf2fb27b6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.0-alpha20241023/terraform_1.10.0-alpha20241023_linux_amd64.zip"
    sha256 "6b78b525637aa57c4228cbd9992919a49b0a2393ed77455eba04e485e1fdd8a3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.0-alpha20241023/terraform_1.10.0-alpha20241023_linux_arm.zip"
    sha256 "a9bfcae6b8234a8e33c4bbddb605c8e81b00724cdf553ac281c11a4665e4b94c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.0-alpha20241023/terraform_1.10.0-alpha20241023_linux_arm64.zip"
    sha256 "92e2aa831171d13807e22d6be9d1cdd87a4f45d83d9ca32dc833ad2d260b02a7"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
