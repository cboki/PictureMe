class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.all
  end

 def show
    @Photographer = Photographer.find(params[:id])
    @review = Review.new
  end



end
