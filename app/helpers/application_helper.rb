module ApplicationHelper

	def full_title
		@title ? "Across EC | #{@title}" : "Across EC"
	end
end
