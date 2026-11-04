class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/7c4cf4e37911be232cf0098fad715032e0c32b28.tar.gz"
  version "2026.11.03-7c4cf4e"
  sha256 "b26539991a9f00743583d4a6df9e78efc16e24a8035d30531ac679004ab74c2a"
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
