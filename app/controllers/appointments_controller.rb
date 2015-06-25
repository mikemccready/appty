class AppointmentsController < ApplicationController
  #before_action :set_appointment, only: [:show, :edit, :update, :destroy]
   
  def index
    @appointments = Appointment.all
      respond_to do |format|
          format.html {
              render
          }
          format.json {
              render json: @appointments
          }
      end
  end


  def show
     @appointment = Appointment.find(params[:id])
  end


  def new
    @appointment = Appointment.new
  end


  def edit
    @appointment = Appointment.find(params[:id])
    @appointment.update_attributes(:user_id => current_user.id,
                                  :summary => current_user.user_name,
                                  :availability => false)





    if @appointment.save

      client = Google::APIClient.new
      client.authorization.access_token = @appointment.provider.token
      service = client.discovered_api('calendar', 'v3')

      @result = client.execute(:api_method => service.events.get, 
                          :parameters => {'calendarId' => 'primary', 'eventId' => @appointment.event_id } )

      appointment = @result.data
      appointment.summary = @appointment.summary
      # event.start.dateTime = @event.start_time
      # event.end.dateTime = @event.end_time
      # event.description = @event.description
      # event.location = @event.location

      @result = client.execute(:api_method => service.events.update,
                              :parameters => {'calendarId' => 'primary', 'eventId' =>  @appointment.event_id},
                              :body_object => appointment,
                              :headers => {'Content-Type' => 'application/json'})
      


      flash[:notice] = "Confirmed!"
      redirect_to appointment_path
    else
      render :new
    end
  end

  def create
  end


  def update
    # @appointment = Appointment.update_attribute(params[:id])
    # @appointment.update_attributes(:user_id => current_user.id)
    # if @appointment.save
    #   redirect_to appointments_path
    # else
    #   render :new
  end


  def destroy
    @appointment.destroy
    flash[:notice] = "Your appointment has been successfully cancelled"
    # respond_to do |format|
    #   format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:provider_id, :user_id, :start_time, :end_time, :location, :availability, :summary, :latitude, :longitude)
    end
end
