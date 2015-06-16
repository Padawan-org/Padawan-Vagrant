class GitRole
  def self.run(machine)
      machine.vm.provision "git", type: "shell", path: "provisioning/scripts/git.sh"
  end

  def self.post_message
    ""
  end
end
