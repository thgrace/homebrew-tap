class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/85075004071079fda4d445f5f08714630ae3b3e8.tar.gz"
  version "2026.10.09-8507500"
  sha256 "7f5757b880f91d4183bb80d755fc80e351ddf48d0d2708d99021d2df3fcffb11"
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
