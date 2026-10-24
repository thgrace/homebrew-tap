class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/20d94b7dc094acb13b49c322602f3eb62d82f693.tar.gz"
  version "2026.10.23-20d94b7"
  sha256 "a1ef83feb5e990368c0870c1a2575e302e9838755fdc9f54036a47030f593476"
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
