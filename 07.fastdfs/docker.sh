#! /bin/bash
chmod +x entrypoint.sh
mkdir -p /root/fastdfs/data/storage
docker-compose up -d
