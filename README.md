# thgrace/homebrew-tap

Homebrew tap for small command-line tools.

## Install

```bash
brew tap thgrace/tap
```

Install [redis-cli](https://redis.io/) without the full Redis server:

```bash
brew install redis-cli
```

Install [oss-rebuild](https://github.com/google/oss-rebuild):

```bash
brew install oss-rebuild
```

## Formulae

| Formula | Description |
| --- | --- |
| `redis-cli` | Redis command-line interface client only. |
| `oss-rebuild` | CLI tool for OSS Rebuild. |

## Notes

The `redis-cli` formula conflicts with the `redis` formula because `redis` already packages the server and CLI.

## Version

The `redis-cli` formula is automatically updated daily via GitHub Actions when a new [Redis release](https://github.com/redis/redis/releases) is published.

The `oss-rebuild` formula is pinned to an upstream commit because `google/oss-rebuild` does not currently publish tagged releases.
