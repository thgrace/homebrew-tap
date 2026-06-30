class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/8973ed9b2055a5619de239e16e157f71d8c876d1.tar.gz"
  version "2026.06.29-8973ed9"
  sha256 "d414167e4da0f221d34655b48c643488d44993e06b853e81b9f634f2d66afd6e"
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
