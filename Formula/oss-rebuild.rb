class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/d9607427204cb656191d81ef54baf0e4b6b911bf.tar.gz"
  version "2026.10.13-d960742"
  sha256 "26f1c1bbcec7d418d456ff05d496d94684b21bc71421fbdcd2986d9c7923aa89"
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
