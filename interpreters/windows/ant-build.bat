@echo off

CD /D %~dp0/../../docker

docker build --no-cache -t sirpole/ant-dev:chrome chrome
docker build --no-cache -t sirpole/ant-dev:httpd httpd
docker build --no-cache -t sirpole/ant-dev:php-7.2 php/7.2
docker build --no-cache -t sirpole/ant-dev:php-7.1 php/7.1
docker build --no-cache -t sirpole/ant-dev:php-5.6 php/5.6
