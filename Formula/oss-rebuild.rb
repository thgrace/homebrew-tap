class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/c50e5b643cc730f4eff5650a416bc1078a3844f1.tar.gz"
  version "2026.07.30-c50e5b6"
  sha256 "e7bdd41fe33ed25a53e8714a43eeb3f7d94c509df311e84e7701e8573263f0a4"
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
