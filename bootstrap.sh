#!/bin/sh
set -eu

case $(uname) in
    Linux)
        command=$(cat <<- EOS
            apt install --no-install-recommends --yes \
                  apt-transport-https \
                  curl \
                  git \
                  libffi-dev \
                  libssl-dev \
                  python3-dev \
                  sudo
	EOS
        )
        echo "Install pre-required packages"
        su -c "$command"
        # sudo group
        if ! id -nG | grep sudo > /dev/null; then
            echo "Add sudo group"
            su -c "usermod -aG sudo ${USER}"
        fi
        # pip
        if [ ! -x ~/.local/bin/pip3 ]; then
            echo "Install pip"
            curl -LJO https://bootstrap.pypa.io/get-pip.py
            python3 get-pip.py --user
        fi
        # ansible
        if [ ! -x ~/.local/bin/ansible ]; then
            echo "Install ansible"
            ~/.local/bin/pip3 install --user ansible
        fi
        ANSIBLE_PLAYBOOK="${HOME}/.local/bin/ansible-playbook"
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
${ANSIBLE_PLAYBOOK} -Ki local --limit localhost playbook.yml
