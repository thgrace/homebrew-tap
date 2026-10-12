class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/7a6b7e2cd4be286204986dff44146dcb4b486e51.tar.gz"
  version "2026.10.12-7a6b7e2"
  sha256 "91d52bd6e4247884abdd6943cadf6fbf1d507200affb3786b4cd77952d2a2c83"
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
