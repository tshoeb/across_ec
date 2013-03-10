class Ability < ActiveRecord::Base

class RegistrarAbility
      include CanCan::Ability
      def initialize(user)
    if user.admin
         can :manage, :all
        else
         can :read, Registrar
         can :update, Registrar, :id => user.id
         can :destroy, Registrar, :id => user.id
         can :read, Student
         can :read, Application
        end
  end
end

class StudentAbility
  include CanCan::Ability
  def initialize(user)
      can :read, Student , :id => user.id
      can :update, Student, :id => user.id
      can :destroy, Student, :id => user.id
      can :read, Registrar
      can :read, Schedule
  end
end

end