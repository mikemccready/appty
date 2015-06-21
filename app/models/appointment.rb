class Appointment < ActiveRecord::Base

	belongs_to :user, :class_name => "User"
  	belongs_to :provider, :class_name => "User"


end
