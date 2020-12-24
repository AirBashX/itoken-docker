#! /bin/bash

mkdir -p /root/nginx/conf
mv nginx.conf /root/nginx/conf/nginx.conf
mkdir -p /root/nginx/wwwroot
unzip AdminLTE-2.4.18.zip
\cp AdminLTE-2.4.18  /root/nginx/wwwroot/