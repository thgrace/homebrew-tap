class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/144be4b8c8452c6111b854fafcb891ab703cd3f2.tar.gz"
  version "2026.11.03-144be4b"
  sha256 "5435ce89ef10b4ba2049928fdf97ff6e666e0646aee12b51c9f4bb9d0fecf016"
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
