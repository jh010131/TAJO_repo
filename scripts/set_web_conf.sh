#!/bin/bash

# 가상 호스트 설정을 추가할 파일
conf_file="/etc/httpd/conf/httpd.conf"

# 가상 호스트 설정
virtual_host_config=$(cat <<EOL
<VirtualHost *:80>
    ServerName ${ALB_DNS}

    # 정적 파일 처리
    DocumentRoot /var/www/html

    # 프록시 설정
    ProxyPass /images/ !
    ProxyPass /css/ !
    ProxyPass /fonts/ !
    ProxyPass / http://${NLB_DNS}:8080/
    ProxyPassReverse / http://${NLB_DNS}:8080/

    <Directory "/var/www/html/">
        # 정적 파일에 대한 설정
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>

    <Directory "/var/www/html/fonts/">
        # fonts 디렉토리에 대한 설정
        Options FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>

    <Directory "/var/www/html/css/">
        # css 디렉토리에 대한 설정
        Options FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>

    <Directory "/var/www/html/images/">
        # images 디렉토리에 대한 설정
        Options FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>

    ErrorLog /var/log/httpd/error.log
    CustomLog /var/log/httpd/access.log combined
</VirtualHost>
EOL
)

# 가상 호스트 설정을 추가할 라인 번호
line_number=95

# 가상 호스트 설정을 파일에 추가
sudo sed -i "${line_number} r /dev/stdin" "$conf_file" <<< "$virtual_host_config"

# 변경사항을 적용하기 위해 아파치 웹 서버를 재시작
sudo systemctl restart httpd