module ApplicationHelper
	def split(fullname)
		index = fullname.index('(')
		fullname = fullname[0..index-2] unless index == nil
		split = fullname.split(' ', 2)
	end
end
