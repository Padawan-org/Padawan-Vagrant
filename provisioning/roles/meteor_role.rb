class MeteorRole
  def self.run(machine)
    machine.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
	  machine.vm.provision "meteor", type: "shell", inline: <<-SHELL
    curl https://install.meteor.com/ | sh
		sudo -H npm install -g meteorite
      SHELL
  end

  def self.post_message
    ""
  end
end
