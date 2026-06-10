# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '2.0.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/2.0.3/nomad_2.0.3_darwin_amd64.zip'
    sha256 '0b536c17ad302518c4022f6d868fa86526c2f17142e8b004fca0d9217cefeb6d'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/2.0.3/nomad_2.0.3_darwin_arm64.zip'
    sha256 'e482c25c608ea7c40bcc75a6802c51580e3fa08e3a78e387faf62b6d499ecb0b'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/2.0.3/nomad_2.0.3_linux_amd64.zip'
    sha256 '8455d5691de4cb451e9443282f1c0171570b480737fc6386992638c52a4795e4'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/2.0.3/nomad_2.0.3_linux_arm64.zip'
    sha256 '61cd1bf830b5db07e87ab5d1dbb73a7b23fbe4c5aed6d81dd0cddc04001b5500'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
