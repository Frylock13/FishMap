class PlaceImage < ActiveRecord::Base

  belongs_to :place

  has_attached_file :image, styles: { thumb: "100x100", small: "400x400" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
