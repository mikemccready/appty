class Appointment < ActiveRecord::Base

	belongs_to :user, :class_name => "User"
  	belongs_to :provider, :class_name => "User"
  	validates_uniqueness_of :event_id, :on => :create
  	validates :start_time, presence: true
  	# validates :location, presence: true



end
