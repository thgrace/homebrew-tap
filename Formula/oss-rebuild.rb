class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/34a6ac7573699288214c58d29b6696c13e13e0d3.tar.gz"
  version "2026.10.25-34a6ac7"
  sha256 "a94f5a8a4b6ca811e3287f6810d16945e5ebb4ceab81fba439786b2d108e56c9"
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
