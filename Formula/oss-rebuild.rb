class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/013d28995496d2ff24fd13d1a1abf3036261e950.tar.gz"
  version "2026.08.20-013d289"
  sha256 "b6a6dcbf779dd35c5bf64d3d7a5a201968d12d8d16058f348bb87470cef82bac"
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
