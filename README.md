# Requirement
- ansible >= 2.2

# Install
```
su
apt install sudo
usermod -aG sudo $USER

sudo apt install git python-setuptools
sudo easy_install pip

# install ansible

git clone https://github.com/choihongil/debian-playbook.git
git submodule update --init

ansible-playbook normal.yml -K
```
