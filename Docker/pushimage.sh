# 获取服务器上的所有Docker镜像列表
images=$(docker images --format "{{.Repository}}:{{.Tag}}")

# 遍历每个镜像并上传到Harbor的m55all-images仓库
for image in $images; do
# 提取镜像的仓库名称和标签
echo $image
repo=$(echo $image | cut -d':' -f1)
tag=$(echo $image | cut -d':' -f2)
# 构建Harbor仓库中的镜像引用
harbor_image="matrixbuaa/$repo:$tag"

# 重新标记镜像，将其命名为Harbor仓库的地址
docker tag $image $harbor_image

# 上传镜像到Harbor
docker push $harbor_image

#删除镜像
docker image rm $harbor_image

echo "镜像 $harbor_image 上传至HUB $HARBOR_PROJECT 仓库成功！"
done

echo "所有Docker镜像上传至HUB $HARBOR_PROJECT 仓库完成。"