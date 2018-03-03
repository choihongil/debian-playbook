```
su -c "apt --no-install-recommends --yes install curl ca-certificates dbus-user-session"
su -c "usermod -aG sudo ${USER}"
logout
sh -c "$(curl -L https://github.com/choihongil/debian-playbook/raw/master/bootstrap.sh)"
```
