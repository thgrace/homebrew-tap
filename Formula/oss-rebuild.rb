class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/11448ce5114f12fb9dba9cb0aac71691d90eb262.tar.gz"
  version "2026.10.09-11448ce"
  sha256 "74d1916ac04bafde467e9d8380eb80adb8ec1051e04d99fd795ba5675490379d"
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
