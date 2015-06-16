class RailsRole
  def self.run(machine)
    machine.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
    machine.vm.provision "rails", type: "shell", path: "provisioning/scripts/rails.sh"
  end

  def self.post_message
    ""
  end
end
