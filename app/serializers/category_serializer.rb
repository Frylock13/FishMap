class CategorySerializer < ActiveModel::Serializer

  attributes :marker_image_url

  def marker_image_url
    ActionController::Base.helpers.image_url(object.marker_image.url(:small))
  end
end
