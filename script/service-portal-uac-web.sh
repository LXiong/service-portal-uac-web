#!/bin/sh

sed -i "s/jdbc.url=.*/jdbc.url=jdbc:mysql:\/\/${DB_HOST}\/${DB_NAME}?useUnicode=true\&characterEncoding=UTF-8/g" ${JDBC_FILE}
sed -i "s/jdbc.username=.*/jdbc.username=${DB_USRER}/g" ${JDBC_FILE}
sed -i "s/jdbc.password=.*/jdbc.password=${DB_PWD}/g" ${JDBC_FILE}

sed -i "s/8080/${SERVER_PORT}/g" ${CATALINA_HOME}/conf/server.xml
sed -i "s/8005/${SHUTDOWN_PORT}/g" ${CATALINA_HOME}/conf/server.xml
sed -i "s/8009/${APJ_PORT}/g" ${CATALINA_HOME}/conf/server.xml

nohup /opt/apache-tomcat-8.0.35/bin/catalina.sh run 