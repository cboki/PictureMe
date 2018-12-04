class AppointmentsController < ApplicationController

  def index
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @photographer = Photographer.find(params[:photographer_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.photographer = @photographer
    @appointment.location = @photographer.location
    @appointment.status = "Pending"
    # needs to be added as soon we have our own user
    # @appointment.user = current_user
    @appointment.user_id = 1
    if @appointment.save
      # needs to be added as soon we have the photografer page
      # redirect_to photographer_path(@photographer)
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :status, :location, :photographer_id)
  end
end
