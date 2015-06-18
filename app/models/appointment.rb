class Appointment < ActiveRecord::Base

	def self.from_api(auto_hash)
    	appointment = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    	appointment.provider_id = auth_hash["creator"]["displayName"]
    	appointment.start_time = auth_hash["start"]["dateTime"]
    	appointment.save!
    	appointment
 	end



end
