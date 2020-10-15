class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :blurb, :artist, :museum_location, :period, :image_location, :style
end
