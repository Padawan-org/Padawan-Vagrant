class MongoRole
  def self.run(machine)
    machine.vm.network "forwarded_port", guest: 27017, host: 27017, auto_correct: true
    machine.vm.provision "mongodb", type: "shell", path: "provisioning/scripts/mongo.sh"
  end

  def self.post_message
    ""
  end
end
