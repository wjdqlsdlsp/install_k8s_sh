# install_k8s_sh
매번 입력하기 귀찮아서 shell로 말아버린 레포

따라하면 생기는 설정 (변경이 필요하면 해당 내용들을 수정)
- k8s v1.26.0
- calico v3.25.0
- pod_cidr 192.168.0.0/16


### ssh 접속

```shell
sudo ssh -i ssh-key.pem ubuntu@<public-ip>
```



### sudo 사용

```shell
sudo -i
```



### 사용법

```shell
git clone https://github.com/wjdqlsdlsp/install_k8s_sh
```



#### 1. Control-plane

```shell
cd install_k8s_sh/control-plane

sh control-plane1.sh
sh control-plane2.sh
```



`[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]` 부분의 `SystemdCgroup` 설정 true로 변경



```shell
sh control-plane3.sh
```

calico를 포함한 모든 pods들이 정상적으로 실행되었으면 `Ctrl + c`

```shell
sh control-plane4.sh
```

위의 명령어를 통해 나온 값을 이후 worker node join시 사용



### 2. worker node

```shell
cd install_k8s_sh/worker

sh worker1.sh
sh worker2.sh
```

control-plane 설정과 동일하게 `[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]` 부분의 `SystemdCgroup` 설정 true로 변경

```shell
sh worker3.sh
```



control-plane 구성에서 `sh control-plane4.sh` 이후 나온 token을 붙여넣기하여 control-plane과 연결시킨다.
