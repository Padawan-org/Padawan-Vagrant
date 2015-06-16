# -*- mode: ruby -*-
# vi: set ft=ruby :

INSTALL_GIT = true
INSTALL_MONGO = false
INSTALL_NODE  = false
INSTALL_TOMCAT= false
INSTALL_JAVA  = false
INSTALL_JENKINS = false
INSTALL_RUBY = true
INSTALL_RAILS = true
INSTALL_POSTGRESQL = true
INSTALL_METEOR = true

post_message = "Hi there!\n"
Vagrant.configure(2) do |config|
  config.vm.define 'padawan-vagrant' do |machine|
    machine.vm.box = "ubuntu/trusty64"
    machine.vm.box_check_update = false
    machine.vm.network "private_network", ip: "10.0.0.2"
    #machine.vm.network "public_network"
    machine.vm.hostname = "padawan-vagrant"
    machine.vm.synced_folder ".", "/workspace"

    machine.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "1024"
      vb.cpus = 1
    end

    if INSTALL_GIT
      machine.vm.provision "git", type: "shell", path: "scripts/git.sh"
    end

    if INSTALL_JAVA
      machine.vm.provision "java", type: "shell", path: "scripts/java.sh"
    end

    if INSTALL_TOMCAT
      machine.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
      machine.vm.synced_folder "webapps", "/opt/tomcat/webapps", create: true
      post_message += "To start tomcat use $CATALINA_BASE/bin/startup.sh\nTo stop tomcat use $CATALINA_BASE/bin/shotdown.sh\n"
      machine.vm.provision "tomcat", type: "shell", path: "scripts/tomcat.sh"
    end

    if INSTALL_NODE
      machine.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
      machine.vm.provision "nodejs", type: "shell", path: "scripts/node.sh"
      post_message += "NodeJs is installed on default path\n"
    end

    if INSTALL_MONGO
      machine.vm.network "forwarded_port", guest: 27017, host: 27017, auto_correct: true
      machine.vm.provision "mongodb", type: "shell", path: "scripts/mongo.sh"
    end

    if INSTALL_JENKINS
      machine.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
      machine.vm.provision "jenkins", type: "shell", path: "scripts/jenkins.sh"
    end

    if INSTALL_RUBY
      #machine.vm.network "forwarded_port", guest: 27017, host: 27017, auto_correct: true
      machine.vm.provision "ruby", type: "shell", path: "scripts/ruby.sh"
    end

    if INSTALL_RAILS
      machine.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
      machine.vm.provision "rails", type: "shell", path: "scripts/rails.sh"
    end

    if INSTALL_POSTGRESQL
      machine.vm.network "forwarded_port", guest: 5432, host: 5432, auto_correct: true
      machine.vm.provision "postgresql", type: "shell", path: "scripts/postgre.sh"
    end

	if INSTALL_METEOR
      machine.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
	  machine.vm.provision "meteor", type: "shell", inline: <<-SHELL
		curl https://install.meteor.com/ | sh
		sudo -H npm install -g meteorite
      SHELL
	end

    machine.vm.post_up_message = post_message + "Access your machine using: vagrant ssh\n\\o/"

  end
end
