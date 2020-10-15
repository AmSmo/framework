class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :portrait
  has_one :gallery
end
