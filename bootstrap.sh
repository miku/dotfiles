#!/usr/bin/env bash

for req in rsync git; do
	command -v $req >/dev/null 2>&1 || {
		echo >&2 "$req required"
		exit 1
	}
done

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

function sync() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "Makefile" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~
	source ~/.bash_profile
}

sync
unset sync
