class Profile < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :first_name, :last_name, :photo, presence: true
  belongs_to :user
end
