class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/f30acec32a54450e6d9811121af6938e9d6af1d7.tar.gz"
  version "2026.07.23-f30acec"
  sha256 "b509ff2ea3b36fa2b472c1cfd22508a24c8df1ac0fe34210b5e19d9b61c1c0a3"
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
