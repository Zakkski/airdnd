class Event < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :game, :description, :date, :location, presence: true
end
