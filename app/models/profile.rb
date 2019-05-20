class Profile < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :first_name, :last_name, :photo, presence: true
  belongs_to :user
end
