module ActorsHelper
	def get_age(dob)
		today = Date.today
		age = today.year - dob.year
		age -= 1 if (dob.month > today.month || (dob.month >= today.month && dob.day > today.day)) #If you haven't had birthday this year, then -1 year
		age
	end
end
