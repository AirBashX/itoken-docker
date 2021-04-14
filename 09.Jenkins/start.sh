#! /bin/bash

#1.设置jenkins数据卷权限
mkdir -p jenkins
chown -R 1000 jenkins

#2.安装java和maven
curl -O https://mirrors.bfsu.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -zxvf apache* -C /root/jenkins
rm -rf apache*
curl -O https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz
tar -zxvf openjdk* -C /root/jenkins
rm -rf openjdk*

#安装插件
#1. push over ssh                   ssh提交
#2. dashbord view
#3. Extended Choice Parameter       回滚