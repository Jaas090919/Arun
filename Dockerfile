FROM tomcat:8
COPY workspace/POC/helloworld.war /usr/local/tomcat/webapps/ROOT.war
