class Room < ApplicationRecord
  has_many :memberships, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
