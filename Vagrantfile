# -*- mode: ruby -*-
# vi: set ft=ruby :

INSTALL_MONGO = false
INSTALL_NODE  = false
INSTALL_TOMCAT= false
INSTALL_JAVA  = false

post_message = "Hi there!\n"
Vagrant.configure(2) do |config|
  config.vm.define 'padawan-vagrant' do |machine|
    machine.vm.box = "ubuntu/trusty64"
    machine.vm.box_check_update = true

    machine.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "256"
    end

    if INSTALL_JAVA
      machine.vm.provision "java", type: "shell", inline: <<-SHELL
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
      SHELL
    end

    if INSTALL_TOMCAT
      machine.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
      machine.vm.synced_folder "webapps", "/opt/tomcat/webapps", create: true
      post_message += "To start tomcat use $CATALINA_BASE/bin/startup.sh\nTo stop tomcat use $CATALINA_BASE/bin/shotdown.sh\n"
      machine.vm.provision "tomcat", type: "shell", inline: <<-SHELL
        echo "Install tomcat"
        if [ ! -f apache-tomcat-8.0.20.tar.gz ]; then
          wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.0.20/bin/apache-tomcat-8.0.20.tar.gz
          tar xvzf apache-tomcat-8.0.20.tar.gz
        fi
        sudo mv -f apache-tomcat-8.0.20/* /opt/tomcat
        sudo mv -f apache-tomcat-8.0.20/webapps/* /opt/tomcat/webapps/*
        echo "CATALINA_HOME=/opt/tomcat">>/etc/environment
      SHELL
    end

    if INSTALL_NODE
      machine.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
      machine.vm.provision "nodejs", type: "shell", inline: <<-SHELL
        echo "Install node"
        curl -sL https://deb.nodesource.com/setup | sudo bash -
        sudo apt-get -y -q install nodejs
        sudo apt-get -y -q install build-essential
      SHELL
      post_message += "NodeJs is installed on default path\n"
    end

    if INSTALL_MONGO
      machine.vm.network "forwarded_port", guest: 27017, host: 27017, auto_correct: true
      machine.vm.provision "mongodb", type: "shell", inline: <<-SHELL
        echo "Install mongo"
        export LC_ALL=C
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
        echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
        sudo apt-get -qq update
        sudo apt-get -y -qq install mongodb-org
      SHELL
    end

    machine.vm.post_up_message = post_message + "Access you machine using: vagrant ssh\n\\o/"

  end
end
