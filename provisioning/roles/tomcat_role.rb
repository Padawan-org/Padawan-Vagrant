class TomcatRole
  def self.run(machine)
    machine.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    machine.vm.synced_folder "webapps", "/opt/tomcat/webapps", create: true
    machine.vm.provision "tomcat", type: "shell", path: "provisioning/scripts/tomcat.sh"
  end

  def self.post_message
    "To start tomcat use $CATALINA_BASE/bin/startup.sh\nTo stop tomcat use $CATALINA_BASE/bin/shotdown.sh\n"
  end
end
