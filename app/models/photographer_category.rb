class PhotographerCategory < ApplicationRecord
  belongs_to :category
  belongs_to :photographer

  validates :category, presence: true
  validates :photographer, presence: true, uniqueness: { scope: :category }
end
