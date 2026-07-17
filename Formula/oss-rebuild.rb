class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/15630fa0c73b3f1bce4bdd81fe91d589d2de6968.tar.gz"
  version "2026.07.16-15630fa"
  sha256 "d384dfc0ae4d6e8c043ae6debc6548a0e33bc672cf968245802d687952bd753e"
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
