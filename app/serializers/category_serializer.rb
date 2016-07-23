class CategorySerializer < ActiveModel::Serializer

  attributes :marker_image_url

  def marker_image_url
    ActionController::Base.helpers.image_url("places/markers/#{object.slug}.png")
  end
end
