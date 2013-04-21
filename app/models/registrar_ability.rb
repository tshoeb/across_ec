class RegistrarAbility < ActiveRecord::Base
  include CanCan::Ability
    def initialize(user)
    	if user.admin == true
         can :manage, :all
		 cannot :create, Deadline
        else
         can :read, Registrar
		 can :read, Student
         can :update, Registrar, :id => user.id
         can :destroy, Registrar, :id => user.id
         can :read, Student, :university_id => user.university_id
         can :read, Application, :university_id => user.university_id
         can :read, University
         can :approve, Application
         can :decline, Application
		 can :read, Schedule
		 can :create, Schedule
		 can :update, Schedule, :registrar_id => user.id
		 can :destroy, Schedule, :registrar_id => user.id
        end
    end
end
