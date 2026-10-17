class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/7d3c0b97ef92153e10c226579f4ea939cc79ea8a.tar.gz"
  version "2026.10.16-7d3c0b9"
  sha256 "d5a341a1b8160a76c7e2ce90013e42b30235961c3e8c7c79b1aa8dd0d6ab4539"
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
