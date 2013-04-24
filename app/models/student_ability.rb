class StudentAbility < ActiveRecord::Base
  include CanCan::Ability
# this is defining the students and public access control
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
	  can :resend_confirmation, Student
	  if user.active == true # condtions only work if user clicks activation link
		can :create, Application
		can :read, Application, :student_id => user.id
		can :update, Application, :student_id => user.id, :status => "Pending"
		cannot :resend_confirmation, Student
		# can :destroy, Application, :student_id => user.id
	  end
  end
end
