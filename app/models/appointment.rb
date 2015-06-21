class Appointment < ActiveRecord::Base

	belongs_to :user, :class_name => "User"
  	belongs_to :provider, :class_name => "User"
  	validates_uniqueness_of :event_id, :on => :create


  	def date_published
      created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
      start_time.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
    end
end
