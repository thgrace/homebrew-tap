class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/0e9fb1702052d605b73940300e59ea1edf20514a.tar.gz"
  version "2026.09.28-0e9fb17"
  sha256 "854d193b9748d794127231f2a394b22b204438a47ca07842862a70bc86f8d8c7"
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
