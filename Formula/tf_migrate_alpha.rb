# frozen_string_literal: true

# Terraform Migrate is a tool for migrating Terraform configurations and state files.
# It helps you manage and automate the migration process, ensuring consistency and reliability.
# This formula installs the latest alpha version of the Terraform Migrate CLI tool.
class TfMigrateAlpha < Formula
  desc 'Terraform Migrate Alpha'
  homepage 'https://www.terraform.io/'
  version '1.3.0-alpha20250919'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250919/tf-migrate_1.3.0-alpha20250919_darwin_amd64.zip'
    sha256 '4ac9465628db4d12c943f24f50c4d05f5ca07e21cfbaecb6c8a6376a41c80213'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250919/tf-migrate_1.3.0-alpha20250919_darwin_arm64.zip'
    sha256 '5658c3119ba1508980fd5ba582015cd29c1a084d74291ba05a7b28264e824a43'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250919/tf-migrate_1.3.0-alpha20250919_linux_amd64.zip'
    sha256 '798e9c8407c81adfdab16872c5d21abea548e6419e33a95400a5cefc9d463e27'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250919/tf-migrate_1.3.0-alpha20250919_linux_arm.zip'
    sha256 '399070d6ed6014fe60f3d1e6aea3e86864e0d7c44ad82d36557661a20862f430'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250919/tf-migrate_1.3.0-alpha20250919_linux_arm64.zip'
    sha256 '3b5f8fc9ecefec72ffad5bb293c687185f0c8a53db6804e3ade773ac5398d85f'
  end

  conflicts_with 'tf-migrate'

  def install
    bin.install 'tf-migrate'
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
