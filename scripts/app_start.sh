#!/bin/bash

# 환경 변수 지정
# BUILD_WAR="/home/ec2-user/build/spring-petclinic.war"
# DEPLOY_PATH="/home/tomcat/apache-tomcat-10.1.12/webapps"
# TOMCAT_STOP="/home/tomcat/apache-tomcat-10.1.12/bin/shutdown.sh"
# TOMCAT_START="/home/tomcat/apache-tomcat-10.1.12/bin/startup.sh"

BUILD_WAR="/home/dp-user/build/spring-petclinic.war"
DEPLOY_PATH="/home/tomcat/apache-tomcat-10.1.12/webapps"
TOMCAT_STOP="/home/tomcat/apache-tomcat-10.1.12/bin/shutdown.sh"
TOMCAT_START="/home/tomcat/apache-tomcat-10.1.12/bin/startup.sh"

# Deploy 경로 실행 권한 부여
chmod +x $DEPLOY_PATH

# Deploy 경로 아래 모든 파일 삭제
rm -rf $DEPLOY_PATH/*

# Spring 아티팩트 파일(.war) Deploy 경로로 복사
cp $BUILD_WAR $DEPLOY_PATH

# 톰캣 재시작
$TOMCAT_STOP
$TOMCAT_START