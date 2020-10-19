class GallerySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
  has_many :paintings
end
