class StudentMailer < ActionMailer::Base

  def registration_confirmation(student) # to send registration confirmation link email
  	@student = student
  	mail(:from => "across.ec@gmail.com", :to => student.email, :subject => "Registration Confirmation")
  end

  def application_confirmation(student) # to send confirmation when user applies for a course
  	@student = student
  	mail(:from => "across.ec@gmail.com", :to => student.email, :subject => "Application Confirmation")
  end
  def application_approved(student, application) # when registrar approves the application, email is sent to student
  	@student = student
  	@application = application
  	mail(:from => "across.ec@gmail.com", :to => student.email, :subject => "Application Approved")
  end
  def application_declined(student, application) # when registrar declines the application, email is sent to student
  	@student = student
  	@application = application
  	mail(:from => "across.ec@gmail.com", :to => student.email, :subject => "Application Declined")
  end
  def password_reset(student) # sends link to reset password 
    @student = student
    mail(:from => "across.ec@gmail.com", :to => student.email, :subject => "Password Reset")
  end
  def resend_confirmation(student) # resends the registration confirmation link
    @student = student
    mail(:from => "across.ec@gmail.com", :to => student.email, :subject => "Registration Confirmation")
  end
end
