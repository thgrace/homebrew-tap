class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/4eb957f0cdc7f131d7d02e84bf6fcd03d3991d24.tar.gz"
  version "2026.10.08-4eb957f"
  sha256 "03d9a79bd818950f51d717ecb0193f686b3bf37e73fd469c8bf7d090825b5f20"
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
