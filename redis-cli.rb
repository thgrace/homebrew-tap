class RedisCli < Formula
  desc "Redis command-line interface client only"
  homepage "https://github.com/thgrace/homebrew-redis-cli"
  version "8.6.0"
  sha256 "d7e5f65f0bb0b4753d0cf98a60f5409a7c9b430ff8ac3397d336260cf64e5a6e"
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
