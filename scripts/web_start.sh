#!/bin/bash

# 웹 서버에 복사할 정적 파일들이 있는 디렉토리
source_dir="https://raw.githubusercontent.com/jh010131/TAJO_repo/main/src/main/resources/static/resources"

# 웹 서버의 정적 파일이 위치할 디렉토리
web_dir="/var/www/html"

# 웹 서버를 재시작할지 여부
restart_web_server=true

# 정적 파일 다운로드
sudo wget -r -nH --cut-dirs=4 -P "$web_dir" "$source_dir"

# 웹 서버 재시작
if [ "$restart_web_server" = true ]; then
    sudo systemctl restart httpd
fi

# 스크립트 종료
exit 0