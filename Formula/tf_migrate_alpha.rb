# frozen_string_literal: true

# Terraform Migrate is a tool for migrating Terraform configurations and state files.
# It helps you manage and automate the migration process, ensuring consistency and reliability.
# This formula installs the latest alpha version of the Terraform Migrate CLI tool.
class TfMigrateAlpha < Formula
  desc 'Terraform Migrate Alpha'
  homepage 'https://www.terraform.io/'
  version '1.3.0-alpha20251003'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20251003/tf-migrate_1.3.0-alpha20251003_darwin_amd64.zip'
    sha256 'dd2113e9c88418598a1fb884f61f01037f1733a3da2c6da198609ed5113f3abc'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20251003/tf-migrate_1.3.0-alpha20251003_darwin_arm64.zip'
    sha256 '3e316daa25ce5492a3ab69caa411ea720e57a9d2f4e27d089a51f6478797639c'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20251003/tf-migrate_1.3.0-alpha20251003_linux_amd64.zip'
    sha256 '2d542af7b9873e0da91aeefd6d0d560215de87c4fd0512cea1207a66029b1808'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20251003/tf-migrate_1.3.0-alpha20251003_linux_arm.zip'
    sha256 '47b13ca80b1c2045dae0aa46d05cadf256860dd14ea5029fd80ad2decc1f6ec7'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20251003/tf-migrate_1.3.0-alpha20251003_linux_arm64.zip'
    sha256 '70285b98db3e12b6ff90f86e3269cca256ed1513fd00cb682903317aa75ec82e'
  end

  conflicts_with 'tf-migrate'

  def install
    bin.install 'tf-migrate'
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
