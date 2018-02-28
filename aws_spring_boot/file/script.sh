#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
apt-get update -y
apt-get install -y nginx

# install git
apt-get install -y git

# install java8
apt-get update -y
apt-get install -y openjdk-8-jdk

# clone application source
git clone -b dev https://github.com/heowc/spring-boot-jenkins.git

# build application
sudo chmod +x spring-boot-jenkins/gradlew
spring-boot-jenkins/gradlew --project-dir ~/spring-boot-jenkins clean build
sudo mv spring-boot-jenkins/build/libs/spring-boot-jenkins-0.0.1-SNAPSHOT.jar spring-boot-exmaple.jar

# change nginx config file
mv nginx.conf /etc/nginx/nginx.conf
mv ngx_proxy.conf /etc/nginx/conf.d/ngx_proxy.conf

# background start spring boot application
sudo nohup java -jar -Dserver.port=8080 /home/ubuntu/spring-boot-exmaple.jar /tmp 2>> /dev/null >> /dev/null &

# start nginx
service nginx start
sudo nginx -s reload
