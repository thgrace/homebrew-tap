class RedisCli < Formula
  desc "Redis command-line interface client only"
  homepage "https://github.com/thgrace/homebrew-tap"
  url "https://download.redis.io/releases/redis-8.10.1.tar.gz"
  sha256 "60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663"
  license all_of: [
    "AGPL-3.0-only",
    "BSD-2-Clause",
    "BSL-1.0",
    "MIT",
    any_of: ["CC0-1.0", "BSD-2-Clause"],
  ]

  depends_on "openssl@3"

  conflicts_with "redis", because: "redis already includes redis-cli"

  def install
    system "make", "redis-cli", "BUILD_TLS=yes", "CC=#{ENV.cc}"
    bin.install "src/redis-cli"
  end

  test do
    system bin/"redis-cli", "--version"
  end
end
