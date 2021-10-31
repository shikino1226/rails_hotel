class Hotel < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  mount_uploader :picture, PictureUploader
end
