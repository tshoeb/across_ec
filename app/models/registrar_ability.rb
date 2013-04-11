class RegistrarAbility < ActiveRecord::Base
  include CanCan::Ability
    def initialize(user)
    	if user.admin == true
         can :manage, :all
		 #cannot :create, Deadline
        else
         can :read, Registrar
         can :update, Registrar, :id => user.id
         can :destroy, Registrar, :id => user.id
         can :read, Student, :university_id => user.university_id
         can :read, Application, :university_id => user.university_id
         can :read, University
         can :approve, Application
         can :decline, Application
		 can :read, Schedule
		 can :create, Schedule
		 can :edit, Schdedule, :registrar_id => user.registrar_id
		 can :destroy, Schdedule, :registrar_id => user.registrar_id
        end
    end
end
