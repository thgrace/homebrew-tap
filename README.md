# homebrew-redis-cli

Install a [redis-cli](http://redis.io/) via homebrew.

## Install

```bash
brew tap thgrace/redis-cli
brew update && brew doctor
brew install redis-cli
```

## Bump formula

```
./bump ${VERSION} > redis-cli.rb
make link
brew info redis-cli
brew uninstall redis-cli
brew install redis-cli
redis-cli -v
make unlink
git tag ${VERSION}
```
