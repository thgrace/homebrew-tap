class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/a066425820c75a4936fbe1515953706add03ee03.tar.gz"
  version "2026.10.27-a066425"
  sha256 "8ff3958c6d1c855b94eb8c6ff9eee2188f85a9ec985d307433bcc15e214173fe"
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
