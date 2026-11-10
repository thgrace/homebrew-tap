class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/6196affe55fcfe3d5aedb739a70f528da50a0587.tar.gz"
  version "2026.11.10-6196aff"
  sha256 "c71d5e24a2c68c0489e7ce0807558fc153189e44cec14e71b766f7e5433a2531"
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
