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
end
