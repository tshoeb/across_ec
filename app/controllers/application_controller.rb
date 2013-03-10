class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  private

  def current_registrar
    @current_registrar ||= Registrar.find(session[:registrar_id]) if session[:registrar_id]
  end

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def current_user
    @current_user ||= current_student || current_registrar
  end

  def current_ability
    if current_user.kind_of?(Registrar)
      @current_ability ||= RegistrarAbility.new(current_user)
    else
      @current_ability ||= StudentAbility.new(current_user)
    end
  end

  helper_method :current_registrar
  helper_method :current_student
  helper_method :current_user
  helper_method :current_ability
 # helper_method :current_account
end
