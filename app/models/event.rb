class Event < ApplicationRecord
  belongs_to :user
  validates :game, :description, :location, presence: true
end
