class Photographer < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :reviews, through: :appointments
  has_many :photos, dependent: :destroy
  has_many :photographer_categories, dependent: :destroy
  has_many :categories, through: :photographer_categories

  validates :location, presence: true
  validates :language, presence: true
  validates :daily_price, presence: true, numericality: true
  validates :user, presence: true, uniqueness: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def stars
    # Calcul the number of stars with all the reviews
    # Return nil if no review, or return the average as an integer
    return if reviews.empty?

    sum = 0
    reviews.each do |review|
      sum += review.stars
    end
    average = sum / reviews.count
    average.floor
  end
end
