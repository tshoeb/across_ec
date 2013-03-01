class Ability < ActiveRecord::Base

  include CanCan::Ability

  def initialize(student)
      can :read, Student , :student_id => student.id
      can :update, Student, :student_id => student.id
      can :destroy, :student_id => student.id
      can :read, Registrar
      can :read, Schedule
  end
 def initialize (registrar)
    if registrar.admin?
      can :manage, :all
    else
      can :read, Registrar
      can :read, Student
      can :update, Registrar, :registar_id => registrar.id
      can :destroy, Registrar, :registar_id => registrar.id
    end
  end
end
