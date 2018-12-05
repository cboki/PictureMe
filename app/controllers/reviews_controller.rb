class ReviewsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
  end

  private
    def review_params
      params.require(:review).permit(:content)
    end
  end
