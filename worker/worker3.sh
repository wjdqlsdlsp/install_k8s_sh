#!/bin/sh

systemctl restart containerd

apt update
apt install -y apt-transport-https ca-certificates curl

curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg \
  https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] \
  https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

apt update
apt install -y kubelet=1.26.0-00 kubeadm=1.26.0-00 kubectl=1.26.0-00
apt-mark hold kubelet kubeadm kubectl