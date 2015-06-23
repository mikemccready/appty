require "rails_helper"



RSpec.describe Appointment, type: :model do
	
	it "does not show if start time has past" do
		# appointment = Appointment.find("apparstart_time.future?")
	end
	
	it "has start time" do
		appointment = Appointment.new(start_time: nil)
		expect(appointment).to be_invalid
	end

	it "has a location" do
		appointment = Appointment.new(location: nil)
		expect(appointment).to be_invalid
	end

	it "has a event summary" do
		appointment = Appointment.new(summary: nil)
		expect(appointment).to be_invalid
	end	


end