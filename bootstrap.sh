#!/bin/bash
set -eu

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
PLAYBOOK="media_server-playbook.yml"

# debian playbook
if [ ! -d ~/debian-playbook ]; then
    echo "Git clone debian-playbook repository"
    git clone --recursive https://github.com/choihongil/debian-playbook.git ~/debian-playbook
fi
# execute playbook
echo "Execute ansible playbook"
cd ~/debian-playbook
${ANSIBLE_PLAYBOOK} -Ki local $PLAYBOOK
