class StudentAbility < ActiveRecord::Base
  include CanCan::Ability

  def initialize(user)
      can :read, Student , :id => user.id
      can :update, Student, :id => user.id
      can :destroy, Student, :id => user.id
      can :read, Registrar
      can :read, Schedule
      can :read, Application, :student_id => user.id
      can :edit, Application, :student_id => user.id
      can :destroy, Application, :student_id => user.id
  end
end
