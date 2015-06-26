class Location < ActiveRecord::Base
	# attr_accessible :address, :latitude, :longitude 
	belongs_to :appointments 
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
