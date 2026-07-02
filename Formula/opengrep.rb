class Opengrep < Formula
  desc "Static code analysis engine to find security issues in code"
  homepage "https://github.com/opengrep/opengrep"
  version "1.25.0"
  license "LGPL-2.1-only"

  on_macos do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_arm64"
      sha256 "3543fcabae9db2ae5bc974a3b75426353f0a3e369181b2157ef27f46867996c8"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_x86"
      sha256 "fa2487b75527be1cc9ae4f9b0cb09a340454e7973c76785568285cbbcd977cb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_aarch64"
      sha256 "fd40124272d006082a5594b19aecee07b01dd50933d8add7a4fd5c557d2be5f6"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_x86"
      sha256 "9ac4aebb47ba3f7b0d8fc641ac8749cb6c2f253f616131a67d9631e00d4bea33"
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
