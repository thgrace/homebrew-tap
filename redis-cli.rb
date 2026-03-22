class RedisCli < Formula
  desc "Redis command-line interface client only"
  homepage "https://github.com/thgrace/homebrew-redis-cli"
  version "null"
  sha256 "340c8464c2007ce3f80682e15dfafa4180b641d53c14201b929906b7b0284d87"
  url "https://download.redis.io/releases/redis-#{version}.tar.gz"
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
