# frozen_string_literal: true

# Terraform Migrate is a tool for migrating Terraform configurations and state files.
# It helps you manage and automate the migration process, ensuring consistency and reliability.
# This formula installs the latest alpha version of the Terraform Migrate CLI tool.
class TfMigrateAlpha < Formula
  desc 'Terraform Migrate Alpha'
  homepage 'https://www.terraform.io/'
  version '1.3.0-alpha20250917'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250917/tf-migrate_1.3.0-alpha20250917_darwin_amd64.zip'
    sha256 '41ad67252967f1353288f654c84a29c2ad535b5e65cf0e393a710f42428b324e'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250917/tf-migrate_1.3.0-alpha20250917_darwin_arm64.zip'
    sha256 '94f41a1c089cb2566038ffd654365866db239d225434f76e15ddca5518fb5cad'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250917/tf-migrate_1.3.0-alpha20250917_linux_amd64.zip'
    sha256 'd355568f1914ee1eb523077f5ade2684c618432a839df7c3c1622931bc79842c'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250917/tf-migrate_1.3.0-alpha20250917_linux_arm.zip'
    sha256 '8bc23f9248e044869f9c4b46d8f4fa2e901c651f7e288e59a587e16db5a3f077'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/1.3.0-alpha20250917/tf-migrate_1.3.0-alpha20250917_linux_arm64.zip'
    sha256 'b820b875e5a9caf905c69a98cf0aca4bba54210e19c57ce30b9a503b89bc1222'
  end

  conflicts_with 'tf-migrate'

  def install
    bin.install 'tf-migrate'
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
