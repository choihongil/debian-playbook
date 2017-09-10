#!/bin/sh

cd
case $OSTYPE in
    linux*)
        su -c "apt install --no-install-recommends --yes \
                  apt-transport-https \
                  curl \
                  git \
                  libffi-dev \
                  libssl-dev \
                  python3-dev \
                  sudo"
        # sudo group
        if ! id -nG | grep sudo > /dev/null; then
            su -c "usermod -aG sudo ${USER}"
        fi
        # pip
        if [ ! -x ~/.local/bin/pip3 ]; then
            curl -LJO https://bootstrap.pypa.io/get-pip.py
            python3 get-pip.py --user
        fi
        # ansible
        if [ ! -x ~/.local/bin/ansible ]; then
            ~/.local/bin/pip3 install --user ansible
        fi
        # debian playbook
        if [ ! -d ~/debian-playbook ]; then
            git clone --recursive https://github.com/choihongil/debian-playbook.git
        fi
        # execute playbook
        cd debian-playbook
        ~/.local/bin/ansible-playbook -Ki local --limit localhost playbook.yml
    darwin*)
	# brew
	if ! which brew > /dev/null; then
	    echo "Install brew"
	    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	# ansible
	if ! brew list | grep ansible > /dev/null; then
	    echo "Install ansible"
	    brew install ansible
	fi
	# iterm2
	if ! brew cask list | grep iterm2 > /dev/null; then
	    echo "Install iterm2"
	    brew cask install iterm2
	fi
	# vagrant
	if ! brew cask list | grep vagrant > /dev/null; then
	    echo "Install vagrant"
	    brew cask install vagrant
	fi
	# virtualbox
	if ! brew cask list | grep virtualbox > /dev/null; then
	    echo "Install virtualbox"
	    brew cask install virtualbox
	fi
        # debian playbook
        if [ ! -d ~/debian-playbook ]; then
            git clone --recursive https://github.com/choihongil/debian-playbook.git
        fi
	# amethyst
	if ! brew cask list | grep amethyst > /dev/null; then
	    echo "Install amethyst"
	    brew cask install amethyst
	fi
	if [ ! -h "${HOME}/.amethyst" ]; then
	    echo "config amethyst"
            BASEDIR=$(cd $(dirname $0); pwd)
	    ln -s "${BASEDIR}/mac/amethyst" "${HOME}/.amethyst"
	fi
esac
