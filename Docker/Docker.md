# DockerLearning

```
Author: Matrix.L
Date: 20300801
```

抄兄弟的：Refer to [https://yveltals.github.io/post/Software/Docker.html](https://yveltals.github.io/post/Software/Docker.html)

### 自配环境

```shell
Linux: Ubuntu 22.04.2 LTS
Docker: 24.0.5
```

### 概念

##### 1. 镜像

操作系统分为 **内核** 和 **用户空间**，对于 `Linux` 而言，内核启动后，会挂载 `root` 文件系统为其提供用户空间支持。Docker的镜像相当于一个 `root` 文件系统。 **镜像** 是一个种特殊的文件系统，由多层文件系统联合组成，除了提供容器运行时所需资源外，还包含了一些为运行时准备的一些配置参数（如匿名卷、环境变量、用户等）。镜像 **不包含任何动态数据**，其内容在构建之后也不会被改变。在构建镜像的时候，需要额外小心，每一层尽量只包含该层需要添加的东西，任何额外的东西应该在该层构建结束前清理掉。

##### 2.容器

镜像是静态的定义，容器是镜像运行时的实体。容器进程运行于属于自己的独立的 [命名空间](https://en.wikipedia.org/wiki/Linux_namespaces)。每一个容器运行时，是以镜像为基础层，在其上创建一个当前容器的存储层，容器存储层的生存周期和容器一样。因此，文件写入操作，都应该使用**数据卷（Volume）**、或者**绑定宿主目录**，在这些位置的读写会跳过容器存储层，直接对宿主（或网络存储）发生读写，其性能和稳定性更高。

##### 3.仓库

一个仓库会包含同一个软件不同版本的镜像，而标签就常用于对应该软件的各个版本。我们可以通过 `<仓库名>:<标签>` 的格式来指定具体是这个软件哪个版本的镜像。如果不给出标签，将以 `latest` 作为默认标签。仓库名经常以 *两段式路径* 形式出现，比如 `jwilder/nginx-proxy`，前者往往意味着 Docker Registry 多用户环境下的用户名，后者则往往是对应的软件名。但这并非绝对，取决于所使用的具体 Docker Registry 的软件或服务。

### Docker 命令

下载无脑参考 https://docs.docker.com/engine/install/

##### 1.Docker pull

```shell
docker pull [OPTIONS] NAME[:TAG|@DIGEST]
```
**镜像名完整格式为 {镜像仓库地址}/{用户名}/{镜像名}:TAG**

默认仓库地址为 docker.io ，默认用户名为 library，默认 TAG 为 latest

##### 2.Docker run

```shell
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

- `-d` ：后台运行
- `-p` ：将容器的端口发布至主机 [主机端口 ： 容器端口]
- `–name `：容器的名字,即在 docker ps 中查看到的 NAMES
- `–restart` ：容器退出时是否重启，always 选项总将重启
- `–link`： {源容器}:{接收容器} 链接容器通信，接收容器可以获取源容器的一些数据
- `-e` ：容器环境变量，如MySQL容器在启动时初始密码 `docker run -e MYSQL_ROOT_PASSWORD=root mysql`
- `--rm` ：容器退出后随之将其删除
- `-it`  `-i`：交互式操作，一个是 `-t `终端。
- `-v`：挂载卷，本地目录:容器目录

##### 3. Docker exec

在容器CONTAINER中,执行命令COMMAND [ARG…]

```
docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
```

复杂的指令调用容器中的bash来执行 `docker exec -it mysql /bin/bash`

##### 4. 容器生命周期管理

- `run`：创建并启动容器 `docker run -p 8008:80 -d nginx:hello_docker`
- `start/stop/restart`：启动/停止/重启容器
- `kill`：杀掉容器
- `rm`：删除容器
- `pause/unpause`：暂停运行/恢复运行容器
- `create`：创建容器(但不启动)
- `exec`：在容器中执行命令

##### 5. 容器管理操作

- `ps`：列出本地容器
- `inspect`：查看容器或镜像的元数据
- `top`：查看容器中正在运行的进程信息
- `attach`：连接到正在运行中的容器，对于守护态后台常用 `docker exec -it CONTAINER /bin/bash`
- `logs`：获取容器日志
- `wait`：阻塞运行直到容器停止,然后打印出它的退出代码
- `export`：将本地某个容器作为一个tar文件导出 ex:`docker export 1e560fca3906 > ubuntu.tar`
- `port`：列出指定容器的端口映射的端口映射 system system df：查看磁盘使用情况

##### 6. 容器rootfs操作

- `commit`：从容器创建一个新的镜像 `docker commit CONTAINER [REPOSITORY[:TAG]]`
- `cp`：在容器与主机之间拷贝数据 `docker cp [LocalPath] [containerID]:[DockerPath]`
- `diff`：检查容器里文件结构的更改

##### 7. 本地镜像管理

- `images`：列出本地镜像
- `rmi`：删除本地镜像
- `tag`：标记本地镜像,将其归入某一仓库 `docker tag nginx:demo {username}/repository1`
- `build`：使用Dockerfile创建镜像 `docker build -t nginx:hello_docker .`
- `history`：查看镜像的创建历史
- `save`：将镜像保存成tar归档文件
- `load`：导入镜像的tar归档文件
- `import`：从归档文件中创建镜像
  将快照文件 ubuntu.tar 导入到镜像 test/ubuntu:v1: `docker import - test/ubuntu:v1`

##### 8. 数据管理

数据卷可以在容器之间共享和重用，对数据卷的修改会立马生效，对数据卷的更新不会影响镜像，数据卷默认会一直存在，即使容器被删除

```shell
#创建一个数据卷
docker volume create volume_name
```

```shell
#查看所有的数据卷
docker volume ls
```

```
#在主机里使用以下命令可以查看指定数据卷的信息
docker volume inspect volume_name/container_name
```

```
#启动一个挂载数据卷的容器 source->target
docker run --mount source=volume_name,target=volume_name IMAGE
           -v source:target
```

##### 9. Docker login

```shell
$ echo "Harbor12345" | docker login --username admin --password-stdin 192.168.0.112:8888
      password                                                       url
```



### Dockerfile构成

**FROM**：定制的镜像基于FROM的镜像。在本例中,基础镜像为Nginx镜像,后续对镜像的更改都是在Nginx镜像基础上操作的。
**RUN**：在构建时执行命令。

COPY：将文件或文件夹在上下文路径及制定路径间复制。用法为 COPY {SRC} {DST} ,其中SRC、DST分别为源路径、目标路径。
ADD：与COPY功能和用法类似,ADD会在复制压缩文件时自动解压缩。
CMD：在运行时执行命令
ENTRYPOINT：配置容器启动后执行的命令。
ENV：定义环境变量。
ARG：定义只在构建时有效的环境变量。
VOLUME：定义匿名数据卷。
EXPOSE：声明端口。
WORKDIR：指定工作目录。
USER：用于指定执行命令的用户和用户组。
HELTHCHECK：用于指定某个程序或指令来监控容器的运行状态。
ONBUILD：用于延迟构建命令的执行,即仅在镜像被引用(FROM)时才会被执行。

### Linux换源

在配置文件 `/etc/docker/daemon.json` 中加入：

```
{
  "registry-mirrors"： ["https：//docker.mirrors.ustc.edu.cn/"]
}
```

重新启动 dockerd：

```shell
sudo systemctl restart docker
```

### 其他配置
```
{
  "insecure-registries": ["http://192.168.0.0:port"], //非安全镜像仓库，配置非 https 仓库地址 
  "exec-opts": ["native.cgroupdriver=cgroupfs"],
  "data-root" : "/home/lib/docker",
}
```

```shell
# 重载修改过的配置文件 
sudo systemctl daemon-reload 
```

```
docker ps  -a --format "table {{.Names}}" | grep sset
docker images | grep sset
docker ps -n=2
docker ps -n=2
docker image ls | grep "matrixbuaa" | awk '{print $3}'
docker run -it --entrypoint sh flask:lky
```

