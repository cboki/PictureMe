class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy
  has_one :photographer, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

 

  
   def full_name
    full_name = "#{first_name} #{last_name}"
    full_name.capitalize
   end
  
  
end

