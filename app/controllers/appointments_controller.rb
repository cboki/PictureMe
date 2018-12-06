class AppointmentsController < ApplicationController

  def index
    @user = current_user
    @userAppointments = Appointment.where(user_id: @user.id)
    @photographers = Photographer.all
  end

  # def new
  #   @appointment = Appointment.new
  #   @photographer = Photographer.find(params[:photographer_id])
  # end

  def create
    @photographer = Photographer.find(params[:photographer_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.photographer = @photographer
    @appointment.location = @photographer.location
    @appointment.status = "pending"
    @appointment.user = current_user
    if @appointment.save
      redirect_to user_appointments_path(@photographer)
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :status, :location, :photographer_id)
  end
end
