class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/cee65ca10b66a45536b76a1ed7664e306b850faf.tar.gz"
  version "2026.08.12-cee65ca"
  sha256 "d448085ab450980ef1f972d5bb3a68041901919d1bbeee7980df393b08ab50c1"
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
