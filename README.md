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
su -c "apt --no-install-recommends --yes install curl ca-certificates dbus-user-session sudo"
su -c "usermod -aG sudo ${USER}"
# logout and re-login that start systemd-logind and user@1000 service and take effect added group sudo
logout
sh -c "$(curl -L https://raw.githubusercontent.com/choihongil/debian-playbook/master/bootstrap.sh)"
```
