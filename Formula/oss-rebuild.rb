class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/75a6e12a9ec35383e8183ac4428620feb7ad8c97.tar.gz"
  version "2026.10.30-75a6e12"
  sha256 "761f6803b5d9662b2bc015f3a99f54e53f97d52c0a20c65df8318aec1e4602c5"
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
