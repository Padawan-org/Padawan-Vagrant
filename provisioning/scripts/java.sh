echo "Install Java"
sudo apt-get -y -qq install software-properties-common htop
sudo apt-get -y -qq install python-software-properties
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -qq update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y -qq install oracle-java8-installer
sudo apt-get -y -qq install oracle-java8-set-default
update-java-alternatives -s java-8-oracle
echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle">>/etc/environment
