class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/733f4df0c0f7421e9d08ba280978c28bd16f8f2c.tar.gz"
  version "2026.11.06-733f4df"
  sha256 "40f0d104aba4117fa75c12ffb3030c6a1175374dccd773cd63c564baeb4eb77d"
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
