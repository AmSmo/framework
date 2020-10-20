class GallerySerializer < ActiveModel::Serializer
  attributes :id, :name, :paintings_with_comments
  has_one :user
  
  
  def paintings_with_comments

    result = self.object.gallery_paintings
    result.map do |gp|
      
      {painting: gp.painting,comment: gp.comment}
      end
      
  end
end
