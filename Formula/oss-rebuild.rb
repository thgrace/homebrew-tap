class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/159ee7196feeba6f795444a41d5f073326c522b1.tar.gz"
  version "2026.10.23-159ee71"
  sha256 "60a449ccd89f9f78565f2a5f24273d553871c805892a95f81c004c16c6fde683"
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
