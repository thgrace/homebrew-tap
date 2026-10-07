class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/0c8c8cc2513c306a01a131abe96601a578ff8a8b.tar.gz"
  version "2026.10.07-0c8c8cc"
  sha256 "9f7538102e9a610c35bacabc700216a44cb7f414e3a503c1e2af2e983017537f"
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
