```
sh -c "$(wget -qO- https://github.com/choihongil/debian-playbook/raw/master/bootstrap.sh)"
```

start minikube
```
sudo -E minikube start --bootstrapper=kubeadm --vm-driver=none --extra-config=apiserver.service-node-port-range=1-5000
```
