class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/8599e8798fa4955a5cae944df8de023cb414f651.tar.gz"
  version "2026.09.23-8599e87"
  sha256 "b41851811dc7657e9f71e03766a26c347e3e7c28aeed05cb678ea52280595850"
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
