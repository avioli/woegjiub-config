#!/bin/bash

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
if [[ -h ~/.bash_profile ]] ; then
	echo "  Removing symbolic link ~/.bash_profile"
	rm ~/.bash_profile
elif [[ -a ~/.bash_profile ]] ; then
	echo "  ~/.bash_profile exists. Moving it to ~/.bash_profile.bak"
	mv ~/.bash_profile ~/.bash_profile.bak || echo "Couldn't move ~/.bash_profile to ~/.bash_profile.bak!"
fi
ln -s `pwd`/bashrc ~/.bash_profile && echo "Linked ~/bash_profile to `pwd`/bashrc" || echo "Couldn't link ~/.bash_profile to `pwd`/bashrc!"

