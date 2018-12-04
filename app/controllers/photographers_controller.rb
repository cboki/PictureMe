class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.all
<<<<<<< HEAD
  end

 def show
    @Photographer = Photographer.find(params[:id])
    @review = Review.new
=======

    @photos = Photo.all

  end

  def show
>>>>>>> 3201f01a3ed36fbc87a47daebdc69d01d68d1ee1
  end



end
