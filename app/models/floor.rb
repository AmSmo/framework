class Floor < ApplicationRecord
    has_many :floor_galleries
    has_many :galleries, through: :floor_galleries
end
