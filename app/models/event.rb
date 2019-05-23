class Event < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :game, :description, :date, :location, presence: true

  include PgSearch
  pg_search_scope :search_by_game_and_description,
                  against: [:game, :description, :location],
                  using: {
                    tsearch: { prefix: true }
                  }
end
