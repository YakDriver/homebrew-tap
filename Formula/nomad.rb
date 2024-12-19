# frozen_string_literal: true

# Nomad is a tool for managing and scheduling workloads.
# It provides a secure and efficient way to deploy and manage applications across dynamic, distributed infrastructure.
# This formula installs the latest stable version of the Nomad CLI tool.
class Nomad < Formula
  desc 'Nomad'
  homepage 'https://www.nomadproject.io/'
  version '1.9.4'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.9.4/nomad_1.9.4_darwin_amd64.zip'
    sha256 '310a6855eb0365d222fcc024a68575da6c108b446b1db7fd02cc3c355e88061a'
  end

  if OS.mac? && Hardware::CPU.arm?
    url 'https://releases.hashicorp.com/nomad/1.9.4/nomad_1.9.4_darwin_arm64.zip'
    sha256 '938b8877d11eefaae4ca4b3489e396a17a2f8a6d5115e55d341f384ae82bc603'
  end

  if OS.linux? && Hardware::CPU.intel?
    url 'https://releases.hashicorp.com/nomad/1.9.4/nomad_1.9.4_linux_amd64.zip'
    sha256 'b3d3b21960c6ffaac981dff1cfcebff2ef430d894ef94acef5f4224af27d72aa'
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://releases.hashicorp.com/nomad/1.9.4/nomad_1.9.4_linux_arm64.zip'
    sha256 '1ac2568d30d115bd3ae647797df7d352a3bbf2244a95132e36072b0c75ca3040'
  end

  conflicts_with 'nomad'

  def install
    bin.install 'nomad'
  end

  test do
    system "#{bin}/nomad --version"
  end
end
