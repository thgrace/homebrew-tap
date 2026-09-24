class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/6afad6dd82bf088ebfec6a21c024557945ac0d40.tar.gz"
  version "2026.09.24-6afad6d"
  sha256 "4ffb31941a97b87f7ddf56c677a301ae6cf2a851af0720fcb53ffca22f741e07"
  license "Apache-2.0"
  head "https://github.com/google/oss-rebuild.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"oss-rebuild"), "./cmd/oss-rebuild"
  end

  test do
    system bin/"oss-rebuild", "--help"
  end
end
