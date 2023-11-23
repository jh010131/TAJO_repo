#!/bin/bash

# 환경 변수 설정을 추가할 파일
env_file="/etc/profile"

# 환경 변수 설정
env_config=$(cat <<EOL
export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto.x86_64
export PATH=\$JAVA_HOME/bin:\$PATH
export CLASS_PATH=\$JAVA_HOME/lib:\$CLASS_PATH

export CATALINA_HOME=/home/tomcat/apache-tomcat-10.1.12
EOL
)

# 환경 변수 설정을 추가할 라인 번호
line_number=85

# 환경 변수 설정을 파일에 추가
sudo sed -i "${line_number} r /dev/stdin" "$env_file" <<< "$env_config"

# 환경 변수 설정 파일 적용
source /etc/profile