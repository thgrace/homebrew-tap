class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/fafd6ab42e5bfd011b13f07b324cfe35f69fbaab.tar.gz"
  version "2026.07.15-fafd6ab"
  sha256 "8a7fa6e6434f0de578f5027e0a1c3831590f5e12ecfd5d0c464b9ffc61eded9a"
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
