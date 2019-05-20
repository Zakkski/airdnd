class Event < ApplicationRecord
  belongs_to :user
  validates :game, :description, :location, presence: true

  has_many :bookings
  has_many :users, through: :bookings
end
