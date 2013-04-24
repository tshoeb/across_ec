class SessionsController < ApplicationController
	# controller that logs in a registrar user
  def new
  end

  def create # authenticates registrar user and logs in user
	  registrar = Registrar.find_by_email(params[:email])
	  if registrar && registrar.authenticate(params[:password])
	    session[:registrar_id] = registrar.id
	    redirect_to root_url, :notice => "Logged in!"
	  else
	    flash.now.notice = "Invalid email or password"
	    render "new"
	  end
	end

  def destroy # log out
    session[:registrar_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
