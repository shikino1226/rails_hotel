class Hotel < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :reserves
end
