class Appointment < ApplicationRecord
  belongs_to :photographer
  belongs_to :user
  has_one :review
end
