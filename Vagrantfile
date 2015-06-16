# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'main.rb'

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

    post_message = "Hi there!\n"
    main =  Main.new(machine, {git:     true,
                               mongo:   true,
                               node:    true,
                               tomcat:  true,
                               java:    true,
                               jenkins: true,
                               ruby:    true,
                               rails:   true,
                               postgre: true,
                               meteor:  true}
                    )
    post_message += main.post_message

    machine.vm.post_up_message = "#{post_message} Access you machine using: vagrant ssh\n\\o/"

  end
end
