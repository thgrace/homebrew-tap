class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/dfe4f7bc413f3acbce62dafc304997a546b1a899.tar.gz"
  version "2026.10.19-dfe4f7b"
  sha256 "1798c8b54f6cc8d45a9707b483f51d640aafcd603c8d310f1542772cc2d26598"
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
