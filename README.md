# Requirement
- ansible >= 2.2

# Install
```
su
apt install sudo git apt-transport-https python3-pip libffi-dev libssl-dev
usermod -aG sudo $USER

# as normal user
pip3 install ansible

git clone --recursive https://github.com/choihongil/debian-playbook.git

ansible-playbook -Ki local playbook.yml
or
ansible-playbook -Ki local --skip-tags=download playbook.yml
```
