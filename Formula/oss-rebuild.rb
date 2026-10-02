class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/d5c0fd2ca8abb9abc512147d99f9c9341e743d1c.tar.gz"
  version "2026.10.01-d5c0fd2"
  sha256 "3d021822929313c56212258e3cfef4a61a8e3e64fbcf382dd529786406ef8b35"
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
