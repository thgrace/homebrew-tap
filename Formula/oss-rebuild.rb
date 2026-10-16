class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/d04f98e4a1aadc7ed2406507352533dfa86c7606.tar.gz"
  version "2026.10.16-d04f98e"
  sha256 "f311d5389648a6e7188ae430d59dfc6c6c4a1360eabd4b96e8f54fc532bdcdc0"
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
