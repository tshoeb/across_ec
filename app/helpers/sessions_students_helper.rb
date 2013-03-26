module SessionsStudentsHelper
	def sign_in(student)
		cookies.permanent.signed[:remember_token] = [student.id]
		self.current_student = student
	end
end
