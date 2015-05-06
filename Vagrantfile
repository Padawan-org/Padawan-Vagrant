# -*- mode: ruby -*-
# vi: set ft=ruby :

INSTALL_MONGO = false
INSTALL_NODE  = false
INSTALL_TOMCAT= false
INSTALL_JAVA  = false
INSTALL_JENKINS = false
INSTALL_RUBY = true
INSTALL_RAILS = true
INSTALL_POSTGRESQL = true

post_message = "Hi there!\n"
Vagrant.configure(2) do |config|
  config.vm.define 'padawan-vagrant' do |machine|
    machine.vm.box = "ubuntu/trusty64"
    machine.vm.box_check_update = false
    machine.vm.network "private_network", ip: "10.0.0.2"
    #machine.vm.network "public_network"
    machine.vm.hostname = "padawan-vagrant"

    machine.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "1024"
      vb.cpus = 1
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

    if INSTALL_JENKINS
      machine.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
      machine.vm.provision "jenkins", type: "shell", inline: <<-SHELL
        echo "Install jenkins"
        wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
        echo "deb http://pkg.jenkins-ci.org/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins-ci.list
        sudo apt-get -qq update
        sudo apt-get -qq -y install jenkins
      SHELL
    end

    if INSTALL_RUBY
      #machine.vm.network "forwarded_port", guest: 27017, host: 27017, auto_correct: true
      machine.vm.provision "ruby", type: "shell", inline: <<-SHELL
        echo "Install ruby"
        sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
        curl -L https://get.rvm.io | bash -s stable
        source ~/.rvm/scripts/rvm
        rvm install 2.2.2
        rvm use 2.2.2 --default
        ruby -v

        echo "Install Bundler"
        echo "gem: --no-ri --no-rdoc" > ~/.gemrc
        gem install bundler
      SHELL
    end

    if INSTALL_RAILS
      machine.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
      machine.vm.provision "rails", type: "shell", inline: <<-SHELL
        echo "Install nodeJs"
        sudo add-apt-repository ppa:chris-lea/node.js
        sudo apt-get update
        sudo apt-get install nodejs

        echo "Install Rails gem"
        gem install rails -v 4.2.1
        rails -v
      SHELL
    end

    if INSTALL_POSTGRESQL
      machine.vm.network "forwarded_port", guest: 5432, host: 5432, auto_correct: true
      machine.vm.provision "postgresql", type: "shell", inline: <<-SHELL
        echo "Install postgresql"
        sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
        wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
        sudo apt-get update
        sudo apt-get install postgresql-common
        sudo apt-get install postgresql-9.3 libpq-dev

        echo "Set postgre password"
        sudo -u postgres psql -c"ALTER user postgres WITH PASSWORD 'postgres'"
        sudo service postgresql restart
      SHELL
    end

    machine.vm.post_up_message = post_message + "Access you machine using: vagrant ssh\n\\o/"

  end
end
