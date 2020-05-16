## Debian
### Prepare install media
- download netinst CD image  
  https://www.debian.org/devel/debian-installer/
- make usb install media
  ```
  sudo cp debian.iso /dev/sdX
  sudo sync
  ```
### Install
```
su -lc "apt install --no-install-recommends --yes ca-certificates sudo wget"
su -lc "usermod -aG sudo ${USER}"
# logout and re-login that take effect added group sudo
exit
wget https://raw.githubusercontent.com/choihongil/debian-playbook/master/bootstrap.sh
bash bootstrap.sh
```

## Mac
```
git clone https://github.com/choihongil/debian-playbook.git
cd debian-playbook
# Install mac applications
./bootstrap.sh
# setup vagrant
vagrant up
```

## Multiple SSH Keys settings for different github account

1. Generate ssh key
```
ssh-keygen -f ~/.ssh/id_rsa_example
```

2. Config ssh
```
# ~/.ssh/config
Host example.github.com
  HostName github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_rsa_example
```

3. Config git
```
# ~/.gitconfig
[includeif "gitdir:~/example/"]
        path = ~/.gitconfig_example
```

4. Additional git config
```
# ~/.gitconfig_example
[user]
	name = name
	email = name@example.com
[url "git@example.github.com"]
        insteadOf = git@github.com
```
