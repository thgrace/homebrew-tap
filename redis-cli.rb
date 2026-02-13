class RedisCli < Formula
  desc "Install the redis-cli only."
  homepage "https://github.com/thgrace/homebrew-redis-cli"
  version "8.6.0"
  sha256 "74261ece988fd2e1526e5aea9f8b9853217d71e2ef2dafaa624ed9579b5f4317"
  url "https://github.com/redis/redis/archive/#{version}.tar.gz"

  conflicts_with "redis", because: "redis already includes redis-cli"

  def install
    system "make redis-cli"
    bin.install "./src/redis-cli"
  end

  test do
    system "#{bin}/redis-cli"
  end
end
