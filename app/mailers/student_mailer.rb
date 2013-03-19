class StudentMailer < ActionMailer::Base

  def registration_confirmation(student)
  	@student = student
  	mail(:from => "across.ec@gmail.com", :to => student.email, :subject => "Regisration Confirmation")
  end

  def application_confirmation(student)
  	@student = student
  	mail(:from => "across.ec@gmail.com", :to => student.email, :subject => "Application Confirmation")
  end
end
