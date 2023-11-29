#!/bin/bash

cd /home/ec2-user

# 웹 서버에 복사할 정적 파일들이 있는 디렉토리
SOURCE_DIR="/home/ec2-user/build/static"

# 웹 서버의 정적 파일이 위치할 디렉토리
WEB_DIR="/var/www/html"

# 웹 서버를 재시작할지 여부
restart_web_server=true

# 정적 파일 다운로드
sudo cp -r $SOURCE_DIR/* $WEB_DIR

# 웹 서버 재시작
if [ "$restart_web_server" = true ]; then
    sudo systemctl restart httpd
fi

sudo rm -rf /home/ec2-user/build/*