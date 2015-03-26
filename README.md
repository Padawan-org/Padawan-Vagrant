# Padawan-Vagrant
This is a simple project to build a virtual development environment using vagrant. It will download and install all you needs using just shell scripts.

## Prerequisites
You will need to install these tools.
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)

## Getting Started
Is your first time using vagrant? It's so simple you just need to run `vagrant up`. Just remember to be on same directory of Vagrantfile.
It would be like that:
    
    host$ git clone https://github.com/Dlimaun/padawan-vagrant.git
    host$ cd padawan-vagrant`
    host$ vagrant up

Your virtual machine is running! \o/
Let's access it with:

    host$ vagrant ssh

## What's installed
There are nothing preinstalled you will select what you need.
Open `Vagrantfile` and remove/comment what you don't want.
There are scripts to install that below but you can add yours too!
* [Java 8](http://java.com/)
* [MongoDB 3](https://www.mongodb.org)
* [NodeJs](https://nodejs.org/)
* [Apache Tomcat 8](http://tomcat.apache.org/)

## Useful Comands
You need to know some commands to use vagrant

    host$ vagrant suspend
This command save the current state of the machine and then stops it. Is useful when you want to continue what you're doing later. This will make your machine start super fast on next `vagrant up`.

    host$ vagrant halt
This command realy shutdown the machine. Means that the current state isn't saved. This method don't save the machine ram on disk like the `vagrant suspend`, but consumes extra disk space.

    host$ vagrant destroy
This command you clear you disk, removing all everything from your guest machine. Be careful.

    host$ vagrant login
    host$ vagrant share
I recommend you to use this command to share your box with others. When you use vagrant you will download the *"brute" OS* and then install all you want using provisionning tools, but that isn't the fast way to share your box because your machine have to download everything after install the *OS*. So when your box is configured share with your team members. You'll need to create a acount on [HashiCorp's Atlas](https://atlas.hashicorp.com/account/new).

    host$ vagrant provision
This command will rerun provision scripts. You can select which script you will want using `--provision-with=<name>` where `<name>` is the name of you provision script.

## Inspiration and Thanks
This project is inspired by [Monitauro Vagrant Rails](https://github.com/pragmaticivan/minotauro_vagrant_rails) which is a virtual machine for Ruby on Rails Application Development.

Thanks to [Rachid Calazans](https://github.com/rachidcalazans) and [Danilo Alcoforado]()
