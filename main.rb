require './provisioning/roles/git_role.rb'
require './provisioning/roles/mongo_role.rb'
require './provisioning/roles/node_role.rb'
require './provisioning/roles/tomcat_role.rb'
require './provisioning/roles/java_role.rb'
require './provisioning/roles/jenkins_role.rb'
require './provisioning/roles/ruby_role.rb'
require './provisioning/roles/rails_role.rb'
require './provisioning/roles/postgre_role.rb'
require './provisioning/roles/meteor_role.rb'

class Main
  def initialize(machine, roles_map)
    @machine      = machine
    @roles_map    = roles_map
    @post_message = ""
    run
  end

  def post_message
    @post_message
  end

  private
  def run
    @roles_map.each do |key, value|
      if value
        clazz_name = "#{key.to_s.capitalize}Role"
        clazz      = Object.const_get(clazz_name)
        clazz.run(@machine)
        @post_message += clazz.post_message
      end
    end
  end
end
