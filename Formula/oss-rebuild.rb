class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/313aad2a59411a72857b360f13ba4f5079caea31.tar.gz"
  version "2026.07.22-313aad2"
  sha256 "1569b9d37c363723ac6ae6bb94d9b1d09f3c886fb540784e23f46c0fa0fe5ca1"
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
