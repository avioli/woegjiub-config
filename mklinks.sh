#!/bin/bash
cd ./home/
for file in [a-zA-Z]* ; do
	if [[ "$file" != "mklinks.sh" &&
		  "$file" != "README.md" &&
		  "$file" != "sensitive" ]] ; then
		if [[ -h ~/."$file" ]] ; then
			echo "  Removing symbolic link ~/.$file"
			rm ~/."$file"
		elif [[ -a ~/."$file" ]] ; then
			echo "  ~/.$file exists. Moving it to ~/.$file.bak"
			mv ~/."$file" ~/."$file".bak || echo "Couldn't move ~/.$file to ~/.$file.bak!"
		fi
		ln -s `pwd`/"$file" ~/."$file" && echo "Linked ~/.$file to `pwd`/$file" || echo "Couldn't link ~/.$file to `pwd`/$file!"
	fi
done

# Create data directories as required
cd $XDG_DATA_HOME
mkdir -p bash/scripts
mkdir -p vim/bundle

for var in dbus gnupg mozilla pki ssh; do
	if [[ -d $HOME/.$var && ! -L $HOME/.$var ]]; then
		mv $HOME/.$var $var
		ln -s `pwd`/$var $HOME/.$var
	fi
done

# Create cache directories as required
cd $XDG_CACHE_HOME
mkdir -p bash
mkdir -p less
mkdir -p vim/view

for var in adobe cddb dbus macromedia mozc thumbnails w3m; do
	if [[ -d $HOME/.$var && ! -L $HOME/.$var ]]; then
		mv $HOME/.$var $var
		ln -s `pwd`/$var $HOME/.$var
	fi
done
