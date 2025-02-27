# frozen_string_literal: true

# Terraform Migrate is a tool for migrating Terraform configurations and state files.
# It helps you manage and automate the migration process, ensuring consistency and reliability.
# This formula installs the latest alpha version of the Terraform Migrate CLI tool.
class TfMigrateAlpha < Formula
  desc 'Terraform Migrate Alpha'
  homepage 'https://www.terraform.io/'
  version '1.0.0-alpha20250227'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.0.0-alpha20250227/tf-migrate_1.0.0-alpha20250227_darwin_amd64.zip'
    sha256 'b2851b817f85fd01bc075b69536efe60cf625f9e62199b5b08a64385c2eb6922'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/tf-migrate/1.0.0-alpha20250227/tf-migrate_1.0.0-alpha20250227_darwin_arm64.zip'
    sha256 '3c712c14c6b23a9e153f4081d7c221a4afe9198ed454bc287d8e2e39b3807e34'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.0.0-alpha20250227/tf-migrate_1.0.0-alpha20250227_linux_amd64.zip'
    sha256 '9e2648d9a02c0f4b9c8214709131d1dda2e9fd4c9ee84f264ca2dd392419a850'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.0.0-alpha20250227/tf-migrate_1.0.0-alpha20250227_linux_arm.zip'
    sha256 '018d25fdefc4872f2bb0b969750299c1d8e17aaf0f301184a0c9f14b5cb04b58'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.0.0-alpha20250227/tf-migrate_1.0.0-alpha20250227_linux_arm64.zip'
    sha256 'bf8ccf39a30b04cc4c7ac2c0692edd05e4be6a7177c6c84dd9fb9729b2799d31'
  end

  conflicts_with 'tf-migrate'

  def install
    bin.install 'tf-migrate'
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
