class Ability < ActiveRecord::Base

  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Schedule
      can :read, Registrar
    
    elsif user.class == Student
      can :read, Student , :id => user.id
      can :update, Student, :id => user.id
      can :destroy, Student, :id => user.id
      can :read, Registrar
      can :read, Schedule
    
    elsif user.class == Registrar
      if user.admin?
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
 #def initialize (registrar)
    #if registrar.admin?
     # can :manage, :all
    #else
     # can :read, Registrar
      #can :read, Student
      #can :update, Registrar, :registar_id => registrar.id
      #can :destroy, Registrar, :registar_id => registrar.id
    #end
  #end
end
