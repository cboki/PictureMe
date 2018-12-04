class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.all

    @photos = Photo.all

  end

  def show
  end
end
