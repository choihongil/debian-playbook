# Requirement
- ansible >= 2.2

# Install
```
su
echo 'deb http://ftp.jp.debian.org/debian jessie-backports/main' > /etc/apt/source.list.d/jessie-backports.list
apt update
apt -t jessie-backports install ansible
apt install sudo git python-setuptools
easy_install pip
usermod -aG sudo $USER

git clone --recursive https://github.com/choihongil/debian-playbook.git

ansible-playbook normal.yml -K
```
