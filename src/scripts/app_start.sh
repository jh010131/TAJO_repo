#!/bin/bash

source /etc/profile
cd /home/ec2-user

BUILD_WAR="/home/ec2-user/build/spring-petclinic.war"
DEPLOY_PATH="$CATALINA_HOME/webapps/"

sudo chmod +x $DEPLOY_PATH
sudo cp $BUILD_WAR $DEPLOY_PATH

sudo service tomcat stop
sudo service tomcat start