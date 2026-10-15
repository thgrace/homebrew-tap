class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/8071472e15f3daad05dcda2111997fa078719b07.tar.gz"
  version "2026.10.14-8071472"
  sha256 "5aa1259c132aef9ad4018345e43e0ca8a8c2250bff3c6349454d83856584c3d5"
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
