### Docker


查看镜像中的内容
```shell
 docker run -it --entrypoint sh 镜像名:标签
```

docker-compose启动容器

```
docker-compose start 
```

docker-compose查看日志

```shell
docker-compose logs --tail 10 -f 服务名称
```

