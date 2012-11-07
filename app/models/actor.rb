class Actor < ActiveRecord::Base

	extend FriendlyId
	friendly_id :fullname, :use => :slugged

	def fullname
		"#{first_name} #{last_name}"
	end

	attr_accessible :name, :dateborn, :image_path

	def self.search(search)
		if search && !search.blank?
			find(:all, :conditions => ['name LIKE ? AND image_path != ?', "%#{search}%", 'nil'])
		else
			find(:all, :conditions => ['image_path != ?', 'nil'])
		end
	
	end
end
