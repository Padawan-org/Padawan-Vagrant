# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  machine.vm.define 'padawan-vagrant' do |machine|
    machine.vm.box = "ubuntu/trusty64
    machine.vm.box_check_update = true

    machine.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true	#tomcat

    machine.vm.provision "java", type: "shell", inline: <<-SHELL
      echo "Install Java"
      sudo apt-get -y -q install software-properties-common htop
      sudo apt-get -y -q install python-software-properties
      sudo add-apt-repository -y ppa:webupd8team/java
      sudo apt-get -qq update
      echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
      sudo apt-get -y -q install oracle-java8-installer
      sudo apt-get -y -q install oracle-java8-set-default
      update-java-alternatives -s java-8-oracle
    SHELL

    machine.vm.provision "tomcat", type: "shell", inline: <<-SHELL
      if [ ! -f apache-tomcat-8.0.20.tar.gz ]; then
        wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.0.20/bin/apache-tomcat-8.0.20.tar.gz
        tar xvzf apache-tomcat-8.0.20.tar.gz
      fi
      sudo mv -f apache-tomcat-8.0.20/* /opt/tomcat
      export JAVA_HOME=/usr/lib/jvm/java-8-oracle
      export CATALINA_HOME=/opt/tomcat
    SHELL
  end
end
