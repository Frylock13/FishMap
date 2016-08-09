class PlaceSerializer < ActiveModel::Serializer

  attributes :id, :title, :description, :latitude, :longitude, :reviews_count, :rating, :rating_image_url, :full_reviews_count

  belongs_to :category

  def rating_image_url
    ActionController::Base.helpers.image_url("ratings/#{object.rating.round}.png")
  end

  def full_reviews_count
    object.reviews.with_comments.count
  end
end
