class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/4e42c15a6631ece6768fcdaf61ad56b0b4381f09.tar.gz"
  version "2026.06.16-4e42c15"
  sha256 "7c762ddb93a6c0b89205a075c75e1efe4ef2ed428f82474b52749e4df5b2cc7f"
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
