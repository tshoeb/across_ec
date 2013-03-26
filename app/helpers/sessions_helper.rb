module SessionsHelper
	def sign_in(registrar)
		cookies.permanent.signed[:remember_token] = [registrar.id]
		self.current_registrar = registrar
	end
end
