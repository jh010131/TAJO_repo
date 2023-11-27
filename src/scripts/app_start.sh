#!/bin/bash

BUILD_WAR="/home/ec2-user/build/spring-petclinic.war"
DEPLOY_PATH="/home/tomcat/apache-tomcat-10.1.12/webapps"


sudo chmod +x $DEPLOY_PATH

sudo rm -rf $DEPLOY_PATH/*

sudo cp $BUILD_WAR $DEPLOY_PATH


sudo /home/tomcat/apache-tomcat-10.1.12/bin/shutdown.sh
sudo /home/tomcat/apache-tomcat-10.1.12/bin/startup.sh