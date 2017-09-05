# Requirement
- ansible >= 2.2

# Install
```
su
apt install sudo curl git apt-transport-https python3-dev libffi-dev libssl-dev
usermod -aG sudo $USER

# as normal user
curl -LJO https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
pip3 install --user ansible

git clone --recursive https://github.com/choihongil/debian-playbook.git

ansible-playbook -Ki local --limit localhost playbook.yml
```
