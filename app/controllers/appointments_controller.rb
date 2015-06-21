class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
   
  def index
    @appointment = Appointment.all
  end


  def show
  end


  def new
    @appointment = Appointment.new
  end


  def edit
    @appointment = Appointment.find(params[:id])
    @appointment.update_attributes(:user_id => current_user.id
                          
      )
    if @appointment.save
      redirect_to appointments_path
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
      params.require(:appointment).permit(:provider_id, :user_id, :start_time, :end_time, :location, :availability, :summary)
    end
end
