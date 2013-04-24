module SessionsHelper
	def sign_in(registrar) # to sign in users
		cookies.permanent.signed[:remember_token] = [registrar.id]
		self.current_registrar = registrar
	end
end
