#!/usr/bin/env bash

if [[ -z "$XDG_CONFIG_HOME" ]]; then
	echo "Please source bashrc first"
	exit
fi

dirs=(
	"$XDG_CACHE_HOME/pip/log"
	"$XDG_DATA_HOME/bash/scripts"
	"$XDG_DATA_HOME/less"
	"$XDG_DATA_HOME/pip"
	"$XDG_DATA_HOME/projects"
	"$XDG_DATA_HOME/python"
	"$XDG_DATA_HOME/pylint"
	"$XDG_DATA_HOME/sqlite3"
	"$XDG_DATA_HOME/vim/bundle"
	"$XDG_DATA_HOME/vim/sessions"
	"$XDG_DATA_HOME/vim/view"
	"$XDG_DATA_HOME/vim/undo"
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

# Git cloning and compilation of vim plugins only if they're not already present
if [[ ! -d "$XDG_DATA_HOME/vim/bundle/vundle" ]]; then
	git clone https://github.com/gmarik/vundle $XDG_DATA_HOME/vim/bundle/vundle
	vim +PluginInstall +qall
	if [[ -d "$XDG_DATA_HOME/vim/bundle/vimproc.vim" ]]; then
		cd "$XDG_DATA_HOME/vim/bundle/vimproc.vim/"
		make
	fi
	if [[ -d "$XDG_DATA_HOME/vim/bundle/YouCompleteMe" ]]; then
		cd "$XDG_DATA_HOME/vim/bundle/YouCompleteMe"
		./install.sh
	fi
fi
