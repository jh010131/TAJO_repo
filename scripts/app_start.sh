#!/bin/bash

cd /home/ec2-user

BUILD_WAR=$(ls /home/ec2-user/build/*.war)
WAR_NAME=$(basename $BUILD_WAR)
echo "> build 파일명: $WAR_NAME" >> /home/ec2-user/deploy.log

echo "> build 파일 복사" >> /home/ec2-user/deploy.log
DEPLOY_PATH="$CATALINA_HOME/webapps/"
cp $BUILD_WAR $DEPLOY_PATH

echo "> 현재 실행중인 애플리케이션 pid 확인" >> /home/ec2-user/deploy.log
CURRENT_PID=$(pgrep -f $WAR_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다." >> /home/ec2-user/deploy.log
else
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> DEPLOY_WAR 배포"    >> /home/ec2-user/deploy.log
sudo service tomcat restart