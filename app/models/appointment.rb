class Appointment < ApplicationRecord
  belongs_to :photographer
  belongs_to :user
  has_one :review

  validates :photographer, presence: true
  validates :user, presence: true
  validates :date, presence: true, uniqueness: { scope: %i[photographer user] }
  validates :location, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending rejected accepted finished) }
end
