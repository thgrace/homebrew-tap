class Opengrep < Formula
  desc "Static code analysis engine to find security issues in code"
  homepage "https://github.com/opengrep/opengrep"
  version "1.30.1"
  license "LGPL-2.1-only"

  on_macos do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_arm64"
      sha256 "7b788794e111ce3fb83f0aa52c100a3b85d37d8b59482262109031f50d4a8d91"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_x86"
      sha256 "a8c6d5f51bb38253b48e9a80fca63684aa2a0f9abfeacea27b8d8b5778476bae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_aarch64"
      sha256 "a730f6fdce1e978ea29e610a2e0503bfe1ec31fce08979a9a84e3699f03e16ee"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_x86"
      sha256 "d3195b9d8d5ae93179f6aa5f5daaba6a920a5a09d38c5d5ae5e60924050210c4"
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
