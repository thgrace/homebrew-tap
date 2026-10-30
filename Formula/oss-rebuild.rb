class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/b3baf4a66c69e6636169823f09faac64297dd8fb.tar.gz"
  version "2026.10.29-b3baf4a"
  sha256 "92d362003322814bfae056e9e03e7f33b3709b721553a4f0483361bf7dcf9004"
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
