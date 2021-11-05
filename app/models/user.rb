class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :hotels, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :profile, length: { in: 10..30 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
