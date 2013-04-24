module SessionsStudentsHelper
	def sign_in(student) # to sign in users
		cookies.permanent.signed[:remember_token] = [student.id]
		self.current_student = student
	end
end
