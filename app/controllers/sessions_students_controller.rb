class SessionsStudentsController < ApplicationController

# controller that logs in a student user
  def new
  end

  def create # authenticates student user and logs in user
	  student = Student.find_by_email(params[:email])
	  if student && student.authenticate(params[:password])
	    session[:student_id] = student.id
	    redirect_to root_url, :notice => "Logged in!"
	  else
	    flash.now.notice = "Invalid email or password"
	    render "new"
	  end
  end

  def destroy # log out
    session[:student_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
