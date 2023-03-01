#!/bin/sh

tail -2 kubeadm_output.txt > join_command1.txt
echo $(cat join_command1.txt) "--cri-socket unix:///var/run/containerd/containerd.sock" | sed 's/ \\ --/ --/g' >> join_command.txt

cat join_command.txt