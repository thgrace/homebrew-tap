class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/d9cd3c33e2d7c26149054aee16456428a750f89d.tar.gz"
  version "2026.09.17-d9cd3c3"
  sha256 "0047119548411a361adcbf41900c04ca88b96e623f53fce6d445273aa08e5903"
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
