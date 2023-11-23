#!/bin/bash

init_script="/etc/init.d/tomcat"
java_home="/usr/lib/jvm/java-17-amazon-corretto.x86_64"
catalina_home="/home/tomcat/apache-tomcat-10.1.12"

# Create the init.d script
cat <<EOL > $init_script
#!/bin/bash

export JAVA_HOME=$java_home
export CATALINA_HOME=$catalina_home

case "\$1" in
  start)
    echo "Starting tomcat: "
    \$CATALINA_HOME/bin/startup.sh
    ;;
  stop)
    echo "Shutting down tomcat: "
    \$CATALINA_HOME/bin/shutdown.sh
    ;;
  restart)
    echo "Restarting tomcat: "
    \$CATALINA_HOME/bin/shutdown.sh;
    sleep 5
    \$CATALINA_HOME/bin/startup.sh
    ;;
  *)
    echo "Usage: service tomcat {start|stop|restart}"
    exit 1
    ;;
esac

exit 0
EOL

# Change permissions
sudo chmod 755 $init_script

echo "Init script created at $init_script and permissions changed."

#tomcat 실행
sudo service tomcat start