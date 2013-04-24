module ApplicationHelper

	def full_title # to add titles to all the pages
		@title ? "Across EC | #{@title}" : "Across EC"
	end
end
