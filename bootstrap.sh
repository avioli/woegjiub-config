#!/usr/bin/env bash

# Create cache directories as required
mkdir -p $XDG_CACHE_HOME
cd $XDG_CACHE_HOME

for dir in pip/log; do
	mkdir -p $dir
	echo "made `pwd`/$dir"
done

# Create data directories as required
mkdir -p $XDG_DATA_HOME
cd $XDG_DATA_HOME

for dir in bash/scripts less pip python pylint sqlite3 vim/{bundle,sessions,view,undo}; do
	mkdir -p $dir
	echo "made `pwd`/$dir"
done
touch sqlite3/sqlite_history
touch python/python_history
