### 1. 将`fdfs`目录中所有文件的`192.168.111.101`更改为实际的ip地址

### 2. fastdfs中的压缩版的名称如果改变需要修改`docker-compose.yml`所对应的名称
```sh
ip_address=
sed -i "s/192.168.111.101/${ip_address}" /fdfs/client.conf
sed -i "s/192.168.111.101/${ip_address}" /fdfs/mod_fastdfs.conf
sed -i "s/192.168.111.101/${ip_address}" /fdfs/storage.conf
```

### 3. 使用前执行下面脚本

```sh
chmod +x entrypoint.sh
mkdir -p /root/fastdfs/data/storage
docker-compose up -d
```

