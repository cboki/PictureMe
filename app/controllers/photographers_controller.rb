class PhotographersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @photographers = Photographer.all
  end

 def show
    @Photographer = Photographer.find(params[:id])
    @review = Review.new
    @photos = Photo.all

  end
end
