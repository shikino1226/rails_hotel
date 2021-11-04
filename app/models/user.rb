class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :hotels, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
