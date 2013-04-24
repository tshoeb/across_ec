class PasswordResetsController < ApplicationController

	# Controller to send password reset link to students
  def new
  end
  
  def create # controller action connected to the page that allows user to enter his/her email and get the password reset link
	  student = Student.find_by_email(params[:email])
	  if student
		  student.send_password_reset
		  redirect_to root_url, :notice => "Email sent with password reset instructions."
		else
			redirect_to new_password_reset_path, :notice => "Please enter your email!!"
		end
  end
  
  def edit # finds user using the token and assigns to a variable
	@student = Student.find_by_password_reset_token!(params[:id])
  end
  
  def update # checks if link is 2 hours old or not
	  @student = Student.find_by_password_reset_token!(params[:id])
	  if @student.password_reset_sent_at < 2.hours.ago
		redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  elsif @student.update_attributes(params[:student])
		redirect_to root_url, :notice => "Password has been reset."
	  else
		render :edit
	  end
  end
end
