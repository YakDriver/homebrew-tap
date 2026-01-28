# frozen_string_literal: true

# Terraform Migrate is a tool for migrating Terraform configurations and state files.
# It helps you manage and automate the migration process, ensuring consistency and reliability.
# This formula installs the latest beta version of the Terraform Migrate CLI tool.
class TfMigrateBeta < Formula
  desc 'Terraform Migrate Beta'
  homepage 'https://www.terraform.io/'
  version '2.0.0-beta3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/2.0.0-beta3/tf-migrate_2.0.0-beta3_darwin_amd64.zip'
    sha256 '5968f6d8ba016c99a42608235995d825158a79cd267b4c1179670f040f9312c5'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/tf-migrate/2.0.0-beta3/tf-migrate_2.0.0-beta3_darwin_arm64.zip'
    sha256 'b799071f74ba8eb78c8319448e0c75f5c6ad2775e0fba204d5c89cde7640dbfb'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tf-migrate/2.0.0-beta3/tf-migrate_2.0.0-beta3_linux_amd64.zip'
    sha256 'fa92d8a00808b8b4b6d07803f815ad41a59ae85dc3832e265c12ee3be398b4ca'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/2.0.0-beta3/tf-migrate_2.0.0-beta3_linux_arm.zip'
    sha256 '1b982e2fd39620acbdd58ea5896678b40d26b92f12ebbbe93efc3992b8b67665'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tf-migrate/2.0.0-beta3/tf-migrate_2.0.0-beta3_linux_arm64.zip'
    sha256 '1dd9479c9eff02051c59c54c8df0dd23880fe2829cc9dbdec5b2cf400e8012e1'
  end

  conflicts_with 'tf-migrate'

  def install
    bin.install 'tf-migrate'
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
