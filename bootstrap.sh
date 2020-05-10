#!/bin/bash
set -eu

case $(uname) in
    Linux)
        # python3-distutils for pip install
        # gnupg for add apt key
        echo "Install pre-required packages"
        sudo apt install --no-install-recommends --yes \
                git \
                gnupg \
                python3-distutils
        sudo apt upgrade
        # pip
        if [ ! -x ~/.local/bin/pip3 ]; then
            echo "Install pip"
            wget https://bootstrap.pypa.io/get-pip.py
            python3 get-pip.py --user
        fi
        # ansible
        if [ ! -x ~/.local/bin/ansible ]; then
            echo "Install ansible"
            ~/.local/bin/pip3 install --user ansible
        fi
        ANSIBLE_PLAYBOOK="${HOME}/.local/bin/ansible-playbook"
        
        # select machine type
        PS3="Select machine type: "
        options=("notebook" "media server")
        select opt in "${options[@]}"
        do
            case $opt in
                notebook)
                    PLAYBOOK="notebook.yml"
                    break
                    ;;
                "media server")
                    PLAYBOOK="media_server.yml"
                    break
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
        done
        ;;
    Darwin)
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
        ANSIBLE_PLAYBOOK=/usr/local/bin/ansible-playbook
        PLAYBOOK="mac.yml"
        ;;
esac

# debian playbook
if [ ! -d ~/debian-playbook ]; then
    echo "Git clone debian-playbook repository"
    git clone --recursive https://github.com/choihongil/debian-playbook.git ~/debian-playbook
fi
# execute playbook
echo "Execute ansible playbook"
cd ~/debian-playbook
${ANSIBLE_PLAYBOOK} -Ki local $PLAYBOOK
