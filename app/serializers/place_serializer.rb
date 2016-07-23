class PlaceSerializer < ActiveModel::Serializer

  attributes :id, :title, :description, :latitude, :longitude, :reviews_count, :rating, :rating_image

  def rating_image
    ActionController::Base.helpers.image_tag("ratings/#{object.rating.round}.png")
  end

end
