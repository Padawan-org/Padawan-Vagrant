echo "Install tomcat"
if [ ! -f apache-tomcat-8.0.20.tar.gz ]; then
  wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.0.20/bin/apache-tomcat-8.0.20.tar.gz
  tar xvzf apache-tomcat-8.0.20.tar.gz
fi
sudo mv -f apache-tomcat-8.0.20/* /opt/tomcat
sudo mv -f apache-tomcat-8.0.20/webapps/* /opt/tomcat/webapps/*
echo "CATALINA_HOME=/opt/tomcat">>/etc/environment
