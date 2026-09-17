class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/9d212546a7747ed1989e58ab3968634df095e96d.tar.gz"
  version "2026.09.17-9d21254"
  sha256 "5a5fa26ae9c3cebce101b1f5ae464b298275c89b5b9efdade2f3b4cb1643654c"
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
