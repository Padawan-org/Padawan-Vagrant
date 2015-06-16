class RubyRole
  def self.run(machine)
    #machine.vm.network "forwarded_port", guest: 27017, host: 27017, auto_correct: true
    machine.vm.provision "ruby", type: "shell", path: "provisioning/scripts/ruby.sh"
  end

  def self.post_message
    ""
  end
end
