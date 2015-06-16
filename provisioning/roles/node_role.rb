class NodeRole
  def self.run(machine)
    machine.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
    machine.vm.provision "nodejs", type: "shell", path: "provisioning/scripts/node.sh"
  end

  def self.post_message
    "NodeJs is installed on default path\n"
  end
end

