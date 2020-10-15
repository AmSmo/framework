class Painting < ApplicationRecord
    has_many :favorites
    has_many :gallery_paintings
    has_many :galleries, through: :gallery_paintings
    has_many :users, through: :galleries
end
