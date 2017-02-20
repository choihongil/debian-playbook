# Requirement
- ansible >= 2.2

# Install
```
su
apt install sudo git apt-transport-https python3-pip
pip3 install ansible
usermod -aG sudo $USER

git clone --recursive https://github.com/choihongil/debian-playbook.git

ansible-playbook -Ki local playbook.yml
```
