class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/0d2bb0ba388924db2b80c4c9d8f9fb84e1622632.tar.gz"
  version "2026.10.01-0d2bb0b"
  sha256 "d36113c18bfad0ec55d7d74a5933c1a60e6438cc1265b33d248657a196fa4240"
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
