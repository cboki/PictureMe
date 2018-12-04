class PhotographersController < ApplicationController
  def index
  end
  def show
    @photographer = Photographer.find(params[:id])
  end
end
