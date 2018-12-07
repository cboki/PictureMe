class PhotographersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @photographers = PgSearch.multisearch(params[:query])

    else
      @photographers = Photographer.all
    end
  end

  def show
    @photographer = Photographer.find(params[:id])
    @review = Review.new
    @photos = Photo.all
  end
end
