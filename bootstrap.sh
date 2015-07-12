#!/usr/bin/env bash

if [[ -z "$XDG_CONFIG_HOME" ]]; then
	echo "Please source shrc first"
	exit
fi

dirs=(
	"$XDG_BIN_HOME"
	"$XDG_CACHE_HOME/pip/log"
	"$XDG_CACHE_HOME/gem"
	"$XDG_CONFIG_HOME/gnupg"
	"$XDG_DATA_HOME/bash/scripts"
	"$XDG_DATA_HOME/less"
	"$XDG_DATA_HOME/mpd/lyrics"
	"$XDG_DATA_HOME/pip"
	"$XDG_DATA_HOME/projects"
	"$XDG_DATA_HOME/psql"
	"$XDG_DATA_HOME/pylint"
	"$XDG_DATA_HOME/python"
	"$XDG_DATA_HOME/rtorrent/session"
	"$XDG_DATA_HOME/rtorrent/torrents"
	"$XDG_DATA_HOME/ssh"
	"$XDG_DATA_HOME/sqlite3"
	"$XDG_DATA_HOME/vim/bundle"
	"$XDG_DATA_HOME/vim/sessions"
	"$XDG_DATA_HOME/vim/undo"
	"$XDG_DATA_HOME/vim/view"
	"$XDG_DATA_HOME/zsh"
	"$XDG_LIB_HOME/gems"
)

files=(
	"$XDG_DATA_HOME/sqlite3/sqlite_history"
	"$XDG_DATA_HOME/python/python_history"
)

for dir in "${dirs[@]}"; do
	mkdir -p $dir
	echo "made $dir"
done

for file in "${files[@]}"; do
	touch $file
	echo "touched $file"
done

# Keep submodules updated
git submodule init && git submodule update

# More specific bootstrapping
chmod 700 $XDG_CONFIG_HOME/gnupg
[[ ! -f "$XDG_CONFIG_HOME/ssh/config" ]] && cp "$XDG_CONFIG_HOME/ssh/config"{".example",} && echo "Copied default ssh.config"
[[ ! -L "$XDG_LIB_HOME/gems/bin" ]] && ln -s "$XDG_BIN_HOME" "$XDG_LIB_HOME/gems/bin" && echo "Bootstrapped ruby gems"
if [[ "$(uname)" == "Darwin" ]]; then
	if ! [[ -f "$HOME/library/LaunchAgents/environment.plist" ]]; then
		ln -s {"$XDG_CONFIG_HOME/osx","$HOME/library"}"/LaunchAgents/environment.plist" && echo "Added OS X Environment variables"
	fi
fi

# Update vim
vim +PlugUpdate
