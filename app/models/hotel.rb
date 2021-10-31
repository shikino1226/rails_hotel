class Hotel < ApplicationRecord
  has_many :reserves, dependent: :destroy
  belongs_to :user
  mount_uploader :picture, PictureUploader
end
