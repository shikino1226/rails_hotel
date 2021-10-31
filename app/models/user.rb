class User < ApplicationRecord
  has_many :reserves, dependent: :destroy
  has_many :hotels, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
