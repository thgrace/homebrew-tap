class Container < Formula
  desc "Create and run Linux containers using lightweight virtual machines on Mac"
  homepage "https://github.com/apple/container"
  url "https://github.com/apple/container/releases/download/1.2.2/container-1.2.2-installer-signed.pkg",
      using: :nounzip
  sha256 "f4c7e73f7203725a3512676dfd9ec6c6a98a37093b6fd4a1b0fdcfcb227e2118"
  license "Apache-2.0"
  head "https://github.com/apple/container.git", branch: "main"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    system "pkgutil", "--expand-full", cached_download, "pkg"

    (libexec/"root").install Dir["pkg/Payload/*"]
    bin.write_exec_script libexec/"root/bin/container"
  end

  def caveats
    <<~EOS
      container requires macOS 26 and Apple silicon.

      Start the system service with:
        container system start
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/container --version")
  end
end
