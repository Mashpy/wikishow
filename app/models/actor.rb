class Actor < ActiveRecord::Base
	attr_accessible :name, :dateborn, :image_path

	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			[]
		end
	end
end
