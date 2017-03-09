#! /usr/bin/fish

ruby $DOTFILES/git/git-blame-colored.rb $argv[1] | less -R
