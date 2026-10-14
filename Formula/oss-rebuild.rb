class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/1e22e49ec8f1f6c5bef763fa6e7731404671747d.tar.gz"
  version "2026.10.14-1e22e49"
  sha256 "1b04d8eb641adbd12db976275b4440d2f5fc872f57f1de45cc83389a8ac7e13b"
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
