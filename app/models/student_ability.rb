class StudentAbility < ActiveRecord::Base
  include CanCan::Ability

  def initialize(user)
      user ||= Student.new
      can :create,Student
      can :read, Student , :id => user.id
      can :update, Student, :id => user.id
      can :destroy, Student, :id => user.id
      can :read, Registrar
      can :read, Schedule
	  can :confirm_account, Student
	  can :read, University
	  if user.active == true
		can :create, Application
		can :read, Application, :student_id => user.id
		can :update, Application, :student_id => user.id, :status => "Pending"
		# can :destroy, Application, :student_id => user.id
	  end
  end
end
