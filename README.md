# homebrew-redis-cli

Install [redis-cli](https://redis.io/) via Homebrew — without the full Redis server.

## Install

```bash
brew tap thgrace/redis-cli
brew install redis-cli
```

> **Note:** This conflicts with the `redis` formula as it packages the server and the cli.

## Version

The formula is automatically updated daily via GitHub Actions when a new [Redis release](https://github.com/redis/redis/releases) is published.
