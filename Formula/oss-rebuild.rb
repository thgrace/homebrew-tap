class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/69b2d341a21b4a98df63025ce1cbc67cfe94fe63.tar.gz"
  version "2026.08.13-69b2d34"
  sha256 "82b799e54fae6c2989ee77f9b386bf5eeeee4de23aae64099dcf5b0174a9f674"
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
