class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|#cancan method for showing error if user doesn't have access to some page
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  private

  def current_registrar #this method assigns the current logged in registrar session to a variable
    @current_registrar ||= Registrar.find(session[:registrar_id]) if session[:registrar_id]
  end

  def current_student #this method assigns the current logged in student session to a variable
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def current_user #checks for which kind of user is logged in
    @current_user ||= current_student || current_registrar
  end

  def current_ability #It assigns the current logged in user to a variable for using in the ability file which is authorization
    if current_user.kind_of?(Registrar)
      @current_ability ||= RegistrarAbility.new(current_registrar)
    else
      @current_ability ||= StudentAbility.new(current_student)
    end
  end

  helper_method :current_registrar
  helper_method :current_student
  helper_method :current_ability
end
