#通过安装包安装fastdfs注意版本号和软件安装顺序
FROM ubuntu:latest
LABEL MAINTAINER="ZSP"
ARG module_dir=fastdfs-nginx-module-1.22
ARG nginx_dir=nginx-1.18.0

# 设置源+下载编译工具
RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install make gcc libpcre3-dev zlib1g-dev -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

#复制解压软件到docker,注意版本号
ADD fastdfs/libfastcommon* /usr/local/src/
ADD fastdfs/fastdfs-6* /usr/local/src/
ADD fastdfs/${module_dir}.tar.gz /usr/local/src/
ADD fastdfs/nginx* /usr/local/src/

WORKDIR /usr/local/src
#libfastcommon:编译
RUN cd libfastcommon* && \
    ./make.sh && ./make.sh install

#fastdfs:编译
RUN cd fastdfs-6* && \
    ./make.sh && ./make.sh install && \
    mkdir -p /fastdfs/tracker && mkdir -p /fastdfs/storage &&\
    cp conf/http.conf /etc/fdfs/ && \
    cp conf/mime.types /etc/fdfs/

#复制配置文件到/etc/fdfs
COPY fdfs/ /etc/fdfs/
ADD nginx/nginx.conf /usr/local/src/${nginx_dir}/conf/
ADD nginx/config /usr/local/src/${module_dir}/src

#nginx
RUN cd nginx* && ./configure --add-module=/usr/local/src/${module_dir}/src/ && \
    make && make install
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

WORKDIR /
EXPOSE 8888
CMD ["/bin/bash"]