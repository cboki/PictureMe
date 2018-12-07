class Category < ApplicationRecord
  include PgSearch

  has_many :photographer_categories, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  multisearchable against: :name
end
