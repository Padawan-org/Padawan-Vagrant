class JavaRole
  def self.run(machine)
    machine.vm.provision "java", type: "shell", path: "provisioning/scripts/java.sh"
  end

  def self.post_message
    ""
  end
end
