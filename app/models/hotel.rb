class Hotel < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
