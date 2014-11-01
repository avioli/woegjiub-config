#!/usr/bin/env bash

if [[ -h ~/.bash_profile ]] ; then
	echo "  Removing symbolic link ~/.bash_profile"
	rm ~/.bash_profile
elif [[ -a ~/.bash_profile ]] ; then
	echo "  ~/.bash_profile exists. Moving it to ~/.bash_profile.bak"
	mv ~/.bash_profile ~/.bash_profile.bak ||
		echo "Couldn't move ~/.bash_profile to ~/.bash_profile.bak!"
fi
ln -s `pwd`/bash/bashrc ~/.bash_profile &&
	echo "Linked ~/.bash_profile to `pwd`/bash/bashrc" ||
	echo "Couldn't link ~/.bash_profile to `pwd`/bash/bashrc!"

# Create data directories as required
mkdir -p $XDG_DATA_HOME
cd $XDG_DATA_HOME
mkdir -p bash/scripts
mkdir -p less
mkdir -p vim/{bundle,view}

for file in mozilla pki; do
	if [[ -d $HOME/.$file && ! -h $HOME/.$file ]]; then
		echo "  Moving ~/.$file to XDG_DATA_HOME"
		mv $HOME/.$file $file
		ln -s `pwd`/$file $HOME/.$file
	fi
done

# Create cache directories as required
mkdir -p $XDG_CACHE_HOME
cd $XDG_CACHE_HOME

for file in adobe cddb dbus macromedia; do
	if [[ -d $HOME/.$file && ! -h $HOME/.$file ]]; then
		echo "  Moving ~/.$file to XDG_CACHE_HOME"
		mv $HOME/.$file $file
		ln -s `pwd`/$file $HOME/.$file
	fi
done
