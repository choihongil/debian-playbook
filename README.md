```
su -c "apt --no-install-recommends --yes install curl ca-certificates"
sh -c "$(wget --quiet --output-document=- --no-check-certificate https://github.com/choihongil/debian-playbook/raw/master/bootstrap.sh)"
```
