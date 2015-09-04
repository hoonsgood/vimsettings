#!/bin/bash
working_directory=$(pwd)
files=("vim" "vimrc")

cd ~
for file in "${files[@]}"
do
    vimsettings=."$file"
    echo "Making symbolic link for $file"
    if [ -e "$vimsettings" ] || [ -L "$vimsettings" ]
    then
        rm "$vimsettings"
    fi
    ln -s $working_directory/$file "$vimsettings"
done

# install vundle
echo "Cloning Vundle.vim from github"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sudo npm install jshint -g
cp vim/vimrc.local ~/.vimrc.local

echo "Done!"
