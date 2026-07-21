class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/b01e570f67216fa755ea4e3426b7cf068fee8046.tar.gz"
  version "2026.07.21-b01e570"
  sha256 "a490e0ceac014e79eb791f7c060e40a783cbc15ddb616f522d36f9edb0267a63"
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
