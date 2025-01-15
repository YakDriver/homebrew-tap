# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '1.9.5'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.9.5/nomad_1.9.5_darwin_amd64.zip'
    sha256 '2e8de144449746492038563004b9e0f388e0c227556ed1787dc58acbb0d8ac5c'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/1.9.5/nomad_1.9.5_darwin_arm64.zip'
    sha256 'b3bc921fbd56cf5f274ef209eb2d79a9abd1603409ef72a915119a6d88185d92'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.9.5/nomad_1.9.5_linux_amd64.zip'
    sha256 '290ab1f7fdab2b7197a05eaea4a962d8f2966f7736c957c4c2a8f0196d2bcdb2'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.9.5/nomad_1.9.5_linux_arm64.zip'
    sha256 '13205cb3713cafc8935ccf57119ff66a6955e4a60961cd2c1252679d7ee63d9c'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
