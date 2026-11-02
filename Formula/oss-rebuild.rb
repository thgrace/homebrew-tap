class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/46a9c1174199cd6aa5c196b9a19b4125680e9d79.tar.gz"
  version "2026.11.02-46a9c11"
  sha256 "190208cfb3dbe4e0025cb9bff6f0662d652011e5fd0491b3fa771236dd7b93b3"
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
