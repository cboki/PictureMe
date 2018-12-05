class ReviewsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @photographer = @appointment.photographer
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.appointment = Appointment.find(params[:appointment_id])

    if @review.save
      redirect_to photographers_path
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:stars, :content)
    end
  end
