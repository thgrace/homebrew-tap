class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/f30c18b91d85e97ed0722d6ca5c8bd3406e0e287.tar.gz"
  version "2026.08.19-f30c18b"
  sha256 "9eabd22bac9e6e4d9af78fadb0661f39dea504a5955cc9d3958446f476222ae9"
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
