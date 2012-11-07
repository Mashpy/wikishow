class Actor < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, :use => :slugged

	attr_accessible :name, :dateborn, :image_path

	def self.search(search, page)
		paginate :per_page => 10, :page => page,
				 :conditions => ['name LIKE ? AND image_path != ?', "%#{search}%", 'nil'],
				 :order => 'name'
	
	end
end
