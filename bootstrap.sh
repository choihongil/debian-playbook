#!/bin/sh

BASEDIR=$(cd $(dirname $0); pwd)

case $OSTYPE in
    darwin*)
	# brew
	if [ ! $(which brew) ]; then
	    echo "Install brew"
	    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	# git
	if [ ! $(brew list | grep git) ]; then
	    echo "Install git"
	    brew install git
	fi
	# ansible
	if [ ! $(brew list | grep ansible) ]; then
	    echo "Install ansible"
	    brew install ansible
	fi
	# amethyst
	if [ ! $(brew cask list | grep amethyst) ]; then
	    echo "Install amethyst"
	    brew cask install amethyst
	fi
	if [ ! -h "${HOME}/.amethyst" ]; then
	    echo "config amethyst"
	    ln -s "${BASEDIR}/mac/amethyst" "${HOME}/.amethyst"
	fi
	# iterm2
	if [ ! $(brew cask list | grep iterm2) ]; then
	    echo "Install iterm2"
	    brew cask install iterm2
	fi
	# vagrant
	if [ ! $(brew cask list | grep vagrant) ]; then
	    echo "Install vagrant"
	    brew cask install vagrant
	fi
	# virtualbox
	if [ ! $(brew cask list | grep virtualbox) ]; then
	    echo "Install virtualbox"
	    brew cask install virtualbox
	fi
    linux*)
esac
