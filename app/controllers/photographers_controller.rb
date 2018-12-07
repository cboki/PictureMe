class PhotographersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    if params[:query].present?
      @photographers = PgSearch.multisearch(params[:query])
      @photographers_with_location = Photographer.where.not(latitude: nil, longitude: nil)
      @photographers_with_location = @photographers_with_location.where(location: params[:query])
      @markers = @photographers_with_location.map do |photographer|
        {
          lng: photographer.longitude,
          lat: photographer.latitude
        }
end
      else
        @photographers = Photographer.all
        @photographers_with_location = Photographer.where.not(latitude: nil, longitude: nil)
        @markers = @photographers_with_location.map do |photographer|
          {
            lng: photographer.longitude,
            lat: photographer.latitude
          }
        end
      end
    end


    def show
      @photographer = Photographer.find(params[:id])
      @appointment = Appointment.new
    end
  end
