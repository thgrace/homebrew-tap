class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/10bb3a5b38d25fbdefeb7e0c87b24b91d2151ae9.tar.gz"
  version "2026.11.09-10bb3a5"
  sha256 "fc21b35b013b0453fba596123a4d67d3bb2c23e020b0a2698cf2225a75e180bb"
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
