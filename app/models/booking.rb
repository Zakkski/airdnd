class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :user, uniqueness: { scope: :event, message: "You are already in the party" }

end
