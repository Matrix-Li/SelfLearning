#### 192.168.0.112

###### 启动Harbor
```shell
[root@k8s-master ~]# cd /home
[root@k8s-master home]# ls
harbor  harbordata  k8s  model  nfs  seu  test
[root@k8s-master home]# cd ./harbor
[root@k8s-master harbor]# ls
ca.crt  ca.key  data  habor  harbor  harbor-offline-installer-v2.5.3.tgz  harimageslist.sh  pushimages.sh  yourip.csr  yourip.key
[root@k8s-master harbor]# cd ./harbor
[root@k8s-master harbor]# ls
common  common.sh  docker-compose.yml  harbor.v2.5.3.tar.gz  harbor.yml  install.sh  LICENSE  prepare
[root@k8s-master harbor]# docker-compose up -d
harbor-log is up-to-date
Starting registryctl ...
redis is up-to-date
harbor-db is up-to-date
registry is up-to-date
harbor-portal is up-to-date
harbor-core is up-to-date
Starting registryctl ... done
Starting nginx       ... done
[root@k8s-master harbor]#
```

###### 192.168.0.111

```
```

