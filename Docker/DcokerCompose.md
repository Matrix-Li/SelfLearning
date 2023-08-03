# DockerComposeLearning


##### 默认使用docker-compose.yml构建镜像
```shell
$ docker-compose build
$ docker-compose build --no-cache # 不带缓存的构建
```

##### 指定不同yml文件模板用于构建镜像
```shell
$ docker-compose build -f docker-compose_name.yml
```

##### 列出Compose文件构建的镜像
```shell
$ docker-compose images 
```

##### 启动容器服务

```shell
$ docker-compose up -d service_name
```

##### 停止容器服务

```shell
$ docker-compose stop service_name
```

##### 启动所有编排容器服务

```shell
$ docker-compose up -d 
```

##### 查看正在运行中的容器
```shell
$ docker-compose ps 
```

##### 查看所有编排容器，包括已停止的容器
```shell
$ docker-compose ps -a
```

##### 进入指定容器执行命令
```shell
$ docker-compose exec nginx bash 
$ docker-compose exec web python manage.py migrate --noinput
```

##### 查看容器的实时日志
```shell
$ docker-compose logs -f service_name
```

##### 停止所有up命令启动的容器
```shell
$ docker-compose down 
```

##### 停止所有up命令启动的容器,并移除数据卷
```shell
$ docker-compose down -v
```

##### 重新启动停止服务的容器
```shell
$ docker-compose restart service_name
```

##### 暂停容器
```shell
$ docker-compose pause service_name
```

##### 恢复容器
```shell
$ docker-compose unpause service_name
```

##### 删除web容器，删除前必需停止stop容器服务
```shell
$ docker-compose rm service_name 
```

##### 查看各个服务容器内运行的进程 
```shell
$ docker-compose top              
```

