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

  def current_ability
    @current_ability ||= Ability.new(current_student)
  end

  helper_method :current_registrar
  helper_method :current_student
  helper_method :current_ability
end
