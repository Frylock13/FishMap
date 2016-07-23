class CategorySerializer < ActiveModel::Serializer

  attributes :marker_image_url

  def marker_image_url
    object.marker_image_url
  end
end
