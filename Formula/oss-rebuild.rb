class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/2eb8823db36fbf82f52cf4ab602c2d988f183d99.tar.gz"
  version "2026.07.19-2eb8823"
  sha256 "2649907247fe762bb65591166cc74c3f86faaf1c634fda5e6c3ef1bdda58af2e"
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
