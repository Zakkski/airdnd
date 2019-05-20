class Profile < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
