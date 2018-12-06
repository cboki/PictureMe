class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    ids = Review.where(stars: 5).pluck(:id)
    @review = Review.find(ids.sample)
  end

end
