class SessionsController < ApplicationController

  def new
  end

  def create
	  registrar = Registrar.find_by_email(params[:email])
	  if registrar && registrar.authenticate(params[:password])
	    session[:registrar_id] = registrar.id
	    redirect_to root_url, :notice => "Logged in!"
	  else
	    flash.now.notice = "Invalid email or password"
	    render "new"
	  end
	end

  def destroy
    session[:registrar_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
