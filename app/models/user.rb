class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :hotels, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
