class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/15c0653fc2c5d808d54ef8fadae4984c849634da.tar.gz"
  version "2026.08.05-15c0653"
  sha256 "3de870567f76c3bb25a4b2d94edeca07b673156a303818b0693aad675681ee21"
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
