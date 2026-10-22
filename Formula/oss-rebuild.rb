class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/65ade862d3512e090de406221233138f3347910d.tar.gz"
  version "2026.10.22-65ade86"
  sha256 "61f04cf429f13cd36d5a1cfbfab29cf56a3504d59a6026dae1b0f7472ceea623"
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
