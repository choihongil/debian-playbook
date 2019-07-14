## Prepare install media
- download netinst CD image  
  https://www.debian.org/devel/debian-installer/
- make usb install media
  ```
  sudo cp debian.iso /dev/sdX
  sudo sync
  ```
## Install
```
su -lc "apt --no-install-recommends --yes install sudo"
su -lc "usermod -aG sudo ${USER}"
# logout and re-login that take effect added group sudo
exit
wget https://raw.githubusercontent.com/choihongil/debian-playbook/master/bootstrap.sh
sh bootstrap.sh
```
