#!/bin/sh

image_name="openresty/openresty:alpine"
container_id=$(sudo docker ps | grep "$image_name" | awk '{print $1}')

if [ -z "$container_id" ]; then
  echo "No container found $image_name"
else
  echo "counter found: $container_id"
  sudo docker stop $container_id
fi


sudo docker run -d -p 8080:8080 -p 8443:8443 -v ./conf.d:/etc/nginx/conf.d -v ./echoroot/:/etc/nginx/echoroot/ -v ./ssl/:/etc/nginx/ssl/  $image_name

