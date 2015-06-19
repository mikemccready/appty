class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
   
def index
    @auth = request.env['omniauth.auth']
    session['auth'] = @auth
    @token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.events.list,
      :parameters => {'calendarId' => 'primary' },
      :headers => {'Content-Type' => 'application/json'})


   
    @result.data["items"].each do |i|
      if (i["summary"] == "appty")
        Appointment.create(location: i["location"],
                           start_time: i["start"]["dateTime"],
                           end_time: i["end"]["dateTime"],
                           availability: true,
                           provider_id: current_user.id)
      else

      end
    end  
  end


  def show
  end


  def new
    @appointment = Appointment.new
  end


  def edit
  end

  def create
  end


  def update
    @appointment = Appointment.update_attribute(params[:id])
    @appointment.user_id = current_user.id
    if @appointment.save
      redirect_to appointments_path
    else
      render :new
    end
  end


  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:provider_id, :user_id, :start_time, :end_time, :location, :availability)
    end
end
