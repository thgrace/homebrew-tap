class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/ef63d401097fbba34b77f41ec95241c9fd3e74d1.tar.gz"
  version "2026.10.28-ef63d40"
  sha256 "5695494284a800b43337bed295cffd887a30ca1374424bb809a930af52f0dde7"
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
