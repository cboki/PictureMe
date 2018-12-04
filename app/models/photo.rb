class Photo < ApplicationRecord
  belongs_to :photographer

  validates :url, presence: true
  validates :photographer, presence: true
end
