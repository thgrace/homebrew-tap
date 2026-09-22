class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/56bbb6391a69ff95de6b083b19a37968e83f1ba8.tar.gz"
  version "2026.09.22-56bbb63"
  sha256 "8e468f9901d61561bb8cd9776672d0a4e606bbc98b1da4fb6dc92010c48c9a9d"
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
