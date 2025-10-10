# frozen_string_literal: true

# Terraform Stacks is a tool for managing and deploying infrastructure as code.
# It allows you to define, provision, and manage infrastructure across multiple cloud providers.
# This formula installs the latest stable version of the Terraform Stacks CLI tool.
class Tfstacks < Formula
  desc 'Terraform Stacks'
  homepage 'https://www.terraform.io/'
  version '1.1.1'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tfstacks/1.1.1/tfstacks_1.1.1_darwin_amd64.zip'
    sha256 'd9ec31f320f30cbbffc2d2887122740edbb6d3fefdcbf01fe41b7b371b49d1e9'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/tfstacks/1.1.1/tfstacks_1.1.1_darwin_arm64.zip'
    sha256 '996c61e68d46c42cd92a5493a1ff8599090d5ea5727d1e1021b1e3ba0ed8b097'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/tfstacks/1.1.1/tfstacks_1.1.1_linux_amd64.zip'
    sha256 'ac450d27b25212d038b450399ee1353defae9a9346501c224a488fb42fc66624'
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tfstacks/1.1.1/tfstacks_1.1.1_linux_arm.zip'
    sha256 '5e8266cdc16696b94b8e5469ba2df3af24c8436a9325e4eb4b4529d12f017069'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/tfstacks/1.1.1/tfstacks_1.1.1_linux_arm64.zip'
    sha256 '4ed108426bf9afba2a05a902c9fb7a896c573820fb1466bb6f9b7a295e7a03bc'
  end

  conflicts_with 'tfstacks'

  def install
    bin.install 'tfstacks'
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
