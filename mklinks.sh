#!/bin/bash

for file in [a-zA-Z]* ; do
	if [[ "$file" != "mklinks.sh" && "$file" != "README" ]] ; then

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
