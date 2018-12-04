class ReviewsController < ApplicationController
  def new
    @reviews = Review.com
  end

  def create
    @review = Review.new(review.params)
  end

  private
    def review_params
      params.require(:review).permit(:content)
    end
  end
