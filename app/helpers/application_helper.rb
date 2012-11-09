module ApplicationHelper
	def split(full_name)
		index = full_name.index('(')
		fullname = full_name[0..index-2] unless index == nil
		split = full_name.split(' ', 2)
	end
end
