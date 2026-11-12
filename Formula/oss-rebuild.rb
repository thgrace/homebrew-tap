class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/eff2be6cb9588b6138ac6dbe97f457ec30ccbcee.tar.gz"
  version "2026.11.11-eff2be6"
  sha256 "992de6c5aa4c35fe5dd04bcefe7d12989d7d059f4d4fa930c7bb62589f0f8ba8"
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
