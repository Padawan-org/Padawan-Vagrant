class PostgreRole
  def self.run(machine)
    machine.vm.network "forwarded_port", guest: 5432, host: 5432, auto_correct: true
    machine.vm.provision "postgresql", type: "shell", path: "provisioning/scripts/postgre.sh"
  end

  def self.post_message
    ""
  end
end
