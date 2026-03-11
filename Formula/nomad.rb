# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '1.11.3'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.11.3/nomad_1.11.3_darwin_amd64.zip'
    sha256 'ca8bf44452296db8750b411c73c6d38a872a9fae2632f93164edbc6573433814'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/1.11.3/nomad_1.11.3_darwin_arm64.zip'
    sha256 '8f8bbc6064a039df772fa7daa865185760111d2e2a1f2953ade2b126dff8e5dd'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.11.3/nomad_1.11.3_linux_amd64.zip'
    sha256 '19dac5642a2ba5305e6ff8efee06a708d760ebe4d1cd7936bc3dc526f477dc12'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.11.3/nomad_1.11.3_linux_arm64.zip'
    sha256 '902e44260fcd9297af7042fb33ccd5a29cc2202b57199724f17c96fcd67414d2'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
