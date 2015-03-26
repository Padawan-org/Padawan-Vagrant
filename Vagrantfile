# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  machine.vm.define 'padawan-vagrant' do |machine|
    machine.vm.box = "ubuntu/trusty64
    machine.vm.box_check_update = true

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
  end
end
