class User < ApplicationRecord
  has_one :gallery
  has_many :favorites
  has_many :gallery_paintings, through: :gallery
  has_many :paintings, through: :gallery_paintings
end


