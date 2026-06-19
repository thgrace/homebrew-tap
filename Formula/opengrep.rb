class Opengrep < Formula
  desc "Static code analysis engine to find security issues in code"
  homepage "https://github.com/opengrep/opengrep"
  version "1.23.0"
  license "LGPL-2.1-only"

  on_macos do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_arm64"
      sha256 "945739e56fec4aab28da296811f3473a0ff733af3dc2371d150b071430265c5f"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_x86"
      sha256 "2fa99169e34e9f233fd7412d5cdc167114ba752a2510da3ce322b272c15ab755"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_aarch64"
      sha256 "ddf4935b138a2e825e6860529df1fb031524f7a2da8933ab7b2a16e5939c5178"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_x86"
      sha256 "1f06548af379ab6080698a609612890ffad2d92dc2172f1e97d38d48096d5ef8"
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
