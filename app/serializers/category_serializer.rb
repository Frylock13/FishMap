class CategorySerializer < ActiveModel::Serializer

  attributes :marker_image_url

  def marker_image_url
    if object.marker_image.present?
      ActionController::Base.helpers.image_url(object.marker_image.url(:small))
    else
      ActionController::Base.helpers.image_url('places/default_marker.png')
    end
  end
end
