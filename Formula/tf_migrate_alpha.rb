# frozen_string_literal: true

# Terraform Migrate is a tool for migrating Terraform configurations and state files.
# It helps you manage and automate the migration process, ensuring consistency and reliability.
# This formula installs the latest alpha version of the Terraform Migrate CLI tool.
class TfMigrateAlpha < Formula
  desc 'Terraform Migrate Alpha'
  homepage 'https://www.terraform.io/'
  version '1.3.0-alpha20250930'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250930/tf-migrate_1.3.0-alpha20250930_darwin_amd64.zip'
    sha256 '487d1ed15568f52022c4c98db70b46275db8f0cb3617e18f65339b7c47e48c56'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250930/tf-migrate_1.3.0-alpha20250930_darwin_arm64.zip'
    sha256 '800299a85b4bb1b1dcf1c4c32340d2bd6a1e5cb1218eb0f3b15388a4afa095ac'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250930/tf-migrate_1.3.0-alpha20250930_linux_amd64.zip'
    sha256 '66e4de6a897455767011faabfd73978d39bb3171385c9272aac89c1cd1435f12'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250930/tf-migrate_1.3.0-alpha20250930_linux_arm.zip'
    sha256 'b958893aef5f1269638878f1cc2e2cfbc0970aedfd25dff6a252b92bca8e62da'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250930/tf-migrate_1.3.0-alpha20250930_linux_arm64.zip'
    sha256 '87869728dd6538942582b13bf61f7f61fb496c914a0ea99d4ba72c95dcdfd38c'
  end

  conflicts_with 'tf-migrate'

  def install
    bin.install 'tf-migrate'
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
