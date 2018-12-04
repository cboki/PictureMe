class Review < ApplicationRecord
  belongs_to :appointment

  validates :stars, presence: true, numericality: { only_integer: true }, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :appointment, presence: true, uniqueness: true
end
