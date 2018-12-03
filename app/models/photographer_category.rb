class PhotographerCategory < ApplicationRecord
  belongs_to :category
  belongs_to :photographer
end
