class ReviewsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @photographer = @appointment.photographer
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @appointment = Appointment.find(params[:appointment_id])
    @review.appointment = @appointment
    @photographer = @appointment.photographer
    # @photographer = Photographer.find(params([:]))
    if @review.save
      redirect_to photographer_path(@photographer)
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:stars, :content)
    end
  end
