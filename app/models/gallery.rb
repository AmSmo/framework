class Gallery < ApplicationRecord
  belongs_to :user
  has_one :floor_gallery
  has_many :gallery_paintings
  has_many :paintings, through: :gallery_paintings
end
