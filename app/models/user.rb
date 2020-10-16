class User < ApplicationRecord
  has_secure_password
  has_one :gallery
  has_many :favorites
  has_many :gallery_paintings, through: :gallery
  has_many :paintings, through: :gallery_paintings

  validates :username, uniqueness: { case_sensitive: false }
end


