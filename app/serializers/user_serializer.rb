class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :portrait
  has_one :gallery
end
