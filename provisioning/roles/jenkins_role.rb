class JenkinsRole
  def self.run(machine)
    machine.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    machine.vm.provision "jenkins", type: "shell", path: "provisioning/scripts/jenkins.sh"
  end

  def self.post_message
    ""
  end
end
