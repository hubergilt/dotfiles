export JENKINS_HOME=/opt/tomcat/jenkins
CATALINA_OPTS="$CATALINA_OPTS -Djava.awt.headless=true"
CATALINA_OPTS="$CATALINA_OPTS -Djavax.net.ssl.trustStore=/opt/tomcat/11.0.26/conf/truststore.jks -Djavax.net.ssl.trustStorePassword=changeit"
