class PhotographersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @photographers = Photographer.all
    @photographers_with_location = Photographer.where.not(latitude: nil, longitude: nil)

    @markers = @photographers_with_location.map do |photographer|
      {
        lng: photographer.longitude,
        lat: photographer.latitude
      }
    end

  def show
    @photographer = Photographer.find(params[:id])
    @appointment = Appointment.new
  end
end
