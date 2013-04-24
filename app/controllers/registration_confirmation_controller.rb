class RegistrationConfirmationController < ApplicationController

  # controller for sending registration confirmation email and link
  def new
  end
  
  def create # sends the email
	  student = Student.find_by_email(params[:email])
	  student.send_registration_confirmation if student
	  redirect_to root_url, :notice => "Email sent with account confirmation instructions."
  end
  
  def edit # finds user using the token and assigns to a variable
	@student = Student.find_by_regitration_confirmation_token!(params[:id])
  end
  
  def update # checks if link is 2 hours old or not
	  @student = Student.find_by_regitration_confirmation_token!(params[:id])
	  if @student.regitration_confirmation_sent_at < 2.hours.ago
		redirect_to new_regitration_confirmation_path, :alert => "Account confirmation link has expired."
	  else
		@student.active = true
		redirect_to root_url, :notice => "Account has been confirmed."
	 end
  end
end
