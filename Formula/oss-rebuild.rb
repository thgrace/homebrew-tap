class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/9b5bedd771c24de50d6c9e4077dab853e2904af2.tar.gz"
  version "2026.07.31-9b5bedd"
  sha256 "4601e8144683b2de8d4dd7648bed91f4a4c8a22c0f20cee121e591b7f81e1e57"
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
