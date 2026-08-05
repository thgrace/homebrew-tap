class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/68b47c843019f24f80415642052c6aa92b0541c3.tar.gz"
  version "2026.08.05-68b47c8"
  sha256 "03fd2a9aa3d7708e8a394d6ceb4c9992200bcd8075e2d8cf47b26bb0b6b897d4"
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
