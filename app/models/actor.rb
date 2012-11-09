class Actor < ActiveRecord::Base

	extend FriendlyId
	friendly_id :full_name, :use => :slugged

	def full_name
		"#{first_name} #{last_name}"
	end

	attr_accessible :name, :dateborn, :image_path

	def self.search(search)
		if search && !search.blank?
			find(:all, :conditions => ['(first_name LIKE ? OR last_name LIKE ?) AND image_path != ?', "%#{search}%", "%#{search}%", 'nil'])
		else
			find(:all, :conditions => ['image_path != ?', 'nil'])
		end
	
	end
end
