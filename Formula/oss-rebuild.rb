class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/da9ff31afdebd2c6c2da30fc7c69f3543c94d0fc.tar.gz"
  version "2026.10.06-da9ff31"
  sha256 "7e6c30afcf35c8cabc36cf3822d2bf1c54cb766ba7957666435e1946046f1d9a"
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
