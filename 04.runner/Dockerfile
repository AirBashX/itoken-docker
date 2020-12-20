FROM gitlab/gitlab-runner:latest
MAINTAINER ZSP
ARG mavenv=3.6.3
ARG dockerv=1.26.2
# 配置镜像源
RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update
# 安装 java和maven
RUN apt-get install openjdk-8-jdk -y
WORKDIR /usr/local/
RUN mkdir maven && \
    curl -O http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${mavenv}/binaries/apache-maven-${mavenv}-bin.tar.gz && \
    tar -zxvf apache-maven-${mavenv}-bin.tar.gz && \
    rm -rf apache-maven-${mavenv}-bin.tar.gz
COPY settings.xml /root/.m/settings.xml
# 安装docker
RUN apt-get -y install gnupg2 apt-transport-https ca-certificates curl software-properties-common  && \
    curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get install docker-ce -y && \
    mkdir /etc/docker && \
    touch -c /etc/docker/daemon.json && \
    echo {\"registry-mirrors\":[\"https://eqcxmbvw.mirror.aliyuncs.com\"]} > /etc/docker/daemon.json
#安装docker-compose
WORKDIR /usr/local/bin/
RUN curl -L "https://github.com/docker/compose/releases/download/${dockerv}/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose && \
    chmod +x docker-compose
WORKDIR /root
ENV MAVEN_HOME /usr/local/apache-maven-${mavenv}
ENV PATH $PATH:$MAVEN_HOME/bin