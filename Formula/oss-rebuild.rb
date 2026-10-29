class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/5592f34eeb3609cf23a538e527895a25b4dbeb31.tar.gz"
  version "2026.10.29-5592f34"
  sha256 "36de01d1ff4c74ef5a2691eca48f6a39cef4179bc4b3d46907eae941bdce9343"
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
