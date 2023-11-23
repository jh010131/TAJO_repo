#!/bin/bash

git clone https://github.com/jh010131/TAJO_repo.git

# 웹 서버에 복사할 정적 파일들이 있는 디렉토리
source_dir="/home/ec2-user/TAJO_repo/src/main/resources/static/resources"

# 웹 서버의 정적 파일이 위치할 디렉토리
web_dir="/var/www/html"

# 웹 서버를 재시작할지 여부
restart_web_server=true

# 정적 파일 다운로드
sudo cp -r $source_dir/* $web_dir

# 웹 서버 재시작
if [ "$restart_web_server" = true ]; then
    sudo systemctl restart httpd
fi

# 스크립트 종료
exit 0