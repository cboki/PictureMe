class Category < ApplicationRecord
  has_many :photographer_categories, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
