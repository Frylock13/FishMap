class Category < ActiveRecord::Base
  
  has_many :places

  validates :name, :marker_image, presence: true

  has_attached_file :marker_image, styles: { small: "25x25" }, default_url: "places/missing.png"
  validates_attachment_content_type :marker_image, content_type: /\Aimage\/.*\Z/
end
