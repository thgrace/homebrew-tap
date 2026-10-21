class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/f2281c4e3b79ef4688b794d14da5dc180ee65693.tar.gz"
  version "2026.10.21-f2281c4"
  sha256 "d0359d6636aaf8417f03f5ad06cd8bbac611a14fcd0e3d90c3d427558e16294d"
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
