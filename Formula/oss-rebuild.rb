class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/8c654b3241129523e47c8a28ab2862237a8f2b0c.tar.gz"
  version "2026.09.30-8c654b3"
  sha256 "3ac71910231c5b148ff7bb17e61a94c492cab1ce67ccee2f8a23b210e5c479cf"
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
