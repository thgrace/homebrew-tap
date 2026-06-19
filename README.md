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

Install [Opengrep](https://github.com/opengrep/opengrep):

```bash
brew install opengrep
```

## Formulae

| Formula | Description |
| --- | --- |
| `redis-cli` | Redis command-line interface client only. |
| `oss-rebuild` | CLI tool for OSS Rebuild. |
| `opengrep` | Static code analysis engine to find security issues in code. |

## Notes

The `redis-cli` formula conflicts with the `redis` formula because `redis` already packages the server and CLI.

## Version

The formulae are checked daily by GitHub Actions:

- `redis-cli` follows the latest stable [Redis release](https://github.com/redis/redis/releases).
- `opengrep` follows the latest [Opengrep release](https://github.com/opengrep/opengrep/releases).
- `oss-rebuild` follows the latest `main` commit because `google/oss-rebuild` does not currently publish tagged releases.
