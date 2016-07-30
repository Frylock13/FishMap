class Place < ActiveRecord::Base

  belongs_to :category
  belongs_to :city
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :complains, as: :complainable, dependent: :destroy
  has_many :place_images, dependent: :destroy

  accepts_nested_attributes_for :place_images, :allow_destroy => true

  geocoded_by :id

  validates :title, :category_id, :latitude, :longitude, presence: true

  scope :active, -> { where(active: true) }
  scope :not_active, -> { where(active: false) }
  scope :category_id, -> (category_id) { where(category_id: category_id) }
  scope :reviews_count, -> (reviews_count) { where('reviews_count >= ?', reviews_count) }
  scope :rating, -> (rating) { where('rating >= ?', rating) }
end
