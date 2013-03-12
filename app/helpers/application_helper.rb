module ApplicationHelper

	def full_title
		@title ? "#{@title}" : "Across EC"
	end
end
