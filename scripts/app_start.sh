#!/bin/bash

BUILD_WAR="/home/ec2-user/build/spring-petclinic.war"
DEPLOY_PATH="/home/tomcat/apache-tomcat-10.1.12/webapps"
TOMCAT_STOP="/home/tomcat/apache-tomcat-10.1.12/bin/shutdown.sh"
TOMCAT_START="/home/tomcat/apache-tomcat-10.1.12/bin/startup.sh"

sudo chmod +x $DEPLOY_PATH

sudo cp $BUILD_WAR $DEPLOY_PATH

sudo $TOMCAT_STOP
sudo $TOMCAT_START