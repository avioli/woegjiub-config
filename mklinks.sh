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

# Create cache directories as required
mkdir -p $XDG_CACHE_HOME

# Create data directories as required
mkdir -p $XDG_DATA_HOME
cd $XDG_DATA_HOME
mkdir -p bash/scripts
mkdir -p less
mkdir -p vim/{bundle,view}
