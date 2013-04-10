class RegistrationConfirmationController < ApplicationController
  def new
  end
  
  def create
	  student = Student.find_by_email(params[:email])
	  student.send_registration_confirmation if student
	  redirect_to root_url, :notice => "Email sent with account confirmation instructions."
  end
  
  def edit
	@student = Student.find_by_regitration_confirmation_token!(params[:id])
  end
  
  def update
	  @student = Student.find_by_regitration_confirmation_token!(params[:id])
	  if @student.regitration_confirmation_sent_at < 2.hours.ago
		redirect_to new_regitration_confirmation_path, :alert => "Account confirmation link has expired."
	  else
		@student.active = true
		redirect_to root_url, :notice => "Account has been confirmed."
	 end
  end
end
