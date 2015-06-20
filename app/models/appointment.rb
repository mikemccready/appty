class Appointment < ActiveRecord::Base

	belongs_to :user, :class_name => "User"
  	belongs_to :provider, :class_name => "User"

	class << self
		def self.from_api(auto_hash)
    		appointment = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    		appointment.summary = auth_hash["summary"]
    		appointment.provider_id = auth_hash["creator"]["displayName"]
    		appointment.start_time = auth_hash["start"]["dateTime"]
    		appointment.save!
    		appointment
 		end
 	end	


	# class << self
	#   def from_omniauth(auth_hash)
	#     	user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	#     	user.user_name = auth_hash['info']['name']
 #      		user.email = auth_hash['info']['email']
 #      		user.phone_number = auth_hash['info']['phone']
	# 		user.image_url = auth_hash['info']['image']
	# 		user.url = auth_hash['info']['urls']['Google']
 #      		user.save!
 #      		user

 #      end
 #  	end 	



end
