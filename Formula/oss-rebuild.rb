class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/68e8f18ff7d36725cbb1442e6fb6a7bda2f481b7.tar.gz"
  version "2026.07.14-68e8f18"
  sha256 "5082ae62ccdc6aa97a97920125d9b8795e4be8ea2220263d8e1e19f70c058411"
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
