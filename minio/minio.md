MinIO为以下平台提供了MinIO服务器([`minio`](https://min.io/docs/minio/linux/reference/minio-server/minio-server.html#command-minio))和MinIO CLI的构建。[`mc`](https://min.io/docs/minio/linux/reference/minio-mc.html#command-mc)

###### minio桶

minio的对象是存储在`桶`（Bucket）中的。可以通过MinIO的管理界面或API创建一个新的存储桶，存储桶类似于文件夹，用于组织和管理对象。MinIO 支持在存储桶（Bucket）中创建嵌套存储桶，也就是所谓的"Bucket 嵌套"。这允许在一个存储桶内创建更多的子存储桶，从而实现一种更细粒度的数据组织。类似于文件系统中的目录结构。

- [创建`桶`](https://minio.org.cn/docs/cn/minio/linux/reference/minio-mc/mc-mb.html):`mc mb <别名>/<桶名>`,`<别名>` 是您配置的MinIO服务器的别名（通常是服务器地址），`<桶名>` 是要创建的存储桶的名称。
- [查看`桶`内的对象](https://minio.org.cn/docs/cn/minio/linux/reference/minio-mc/mc-ls.html):``mc ls``
- [本地目录挂载至`桶`](https://www.cnblogs.com/XY-Heruo/p/16489190.html):`./goofys --endpoint=minioServer bucketName localPath`，例子:`./goofys --endpoint=http://192.168.137.8:9090 bk1 /home/minio/`

- [本地文件系统目录复制到`桶`](https://minio.org.cn/docs/cn/minio/linux/reference/minio-mc/mc-cp.html):`mc cp <本地文件路径> <别名>/<桶名>/<目标对象路径>`，例子:`mc cp myfile.txt myminio/mybucket/uploads/myfile.txt`

##### minio过期回收

