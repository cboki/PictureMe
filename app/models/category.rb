class Category < ApplicationRecord
  has_many :photographer_categories

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
