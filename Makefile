link:
	ln -s $(PWD)/redis-cli.rb /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/redis-cli.rb
.PHONY: link

unlink:
	unlink /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/redis-cli.rb
.PHONY: unlink
