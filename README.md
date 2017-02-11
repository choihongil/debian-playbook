# Requirement
- ansible >= 2.2

# Install
```
su
apt install sudo git ansible
usermod -aG sudo $USER

git clone --recursive https://github.com/choihongil/debian-playbook.git

ansible-playbook -Ki local playbook.yml
```
