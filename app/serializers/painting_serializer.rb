class PaintingSerializer < ActiveModel::Serializer
  attributes :id, :blurb, :artist, :museum_location, :dated, :image, :style, :title, :division, :ham_id

end
