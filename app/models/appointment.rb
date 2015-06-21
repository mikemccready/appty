class Appointment < ActiveRecord::Base

	belongs_to :user, :class_name => "User"
  	belongs_to :provider, :class_name => "User"
  	validates_uniqueness_of :event_id

end
