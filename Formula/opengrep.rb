class Opengrep < Formula
  desc "Static code analysis engine to find security issues in code"
  homepage "https://github.com/opengrep/opengrep"
  version "1.27.0"
  license "LGPL-2.1-only"

  on_macos do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_arm64"
      sha256 "9f2c016ac74b9821b73fa3bea86a2d0b9ccb9aabe7b5bd9d6e3ff3b3b05cbd07"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_x86"
      sha256 "911c0b7d0640313aed4300bf4511b707a7309ee5b761cf0301a06c2757113823"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_aarch64"
      sha256 "4efcd2f195da8719f16e4eac79fb918442e04d70f3bcc001fd6105c0afd53aae"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_x86"
      sha256 "9d47d7de3f22ec5a93b25af9126648191e3d3b5d759dd4f699006138724719b3"
    end
  end

  def install
    bin.install Dir["*"].first => "opengrep"
  end

  test do
    (testpath/".config").mkpath
    (testpath/".cache").mkpath
    assert_match version.to_s, shell_output("#{bin}/opengrep --version")
  end
end
