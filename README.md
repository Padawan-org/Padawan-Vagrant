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
There's nothing preinstalled you will select what you need.
Open the `Vagrantfile` and change the variables on top of the file, mark `true` on what you want to be installed.
There are scripts to install that below but you can add yours too!
* [Apache Tomcat 8](http://tomcat.apache.org/)
* [Git](http://git-scm.com/)
* [Java 8](http://java.com/)
* [Jenkins CI](https://jenkins-ci.org/)
* [MongoDB 3](https://www.mongodb.org)
* [NodeJs](https://nodejs.org/)
* [PostgreSql](http://www.postgresql.org/)
* [Ruby](https://www.ruby-lang.org)
* [Ruby on Rails](http://rubyonrails.org/)

Everything is installed by `shell` provisioner and there's no pre-requisits validations. So You'll need check that out before. Example: `Jenkins` needs `Java`, then you need to mark `java` as `true` too.

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
This project is inspired by [Minotauro Vagrant Rails](https://github.com/pragmaticivan/minotauro_vagrant_rails) which is a virtual machine for Ruby on Rails Application Development.

Thanks to [Rachid Calazans](https://github.com/rachidcalazans) and [Danilo Alcoforado]()

## Future and improvements
On future I want to put others scripts.

If you want to help by adding a new script or anything else [Create a issue](https://github.com/Dlimaun/Padawan-Vagrant/issues/new).

Thanks
