module API
	class AppointmentsController < ApplicationController
  
		def index
  			render json: Appointment.all
		end

		def show
  			render json: Appointment.find(params[:id])
		end


  end
	
end