class Review < ActiveRecord::Base
  
  belongs_to :place, counter_cache: true
  belongs_to :user

  has_many :complains, as: :complainable, dependent: :destroy

  scope :with_comments, -> { where.not(review: '') }

  validates :place_id, uniqueness: { scope: :user_id }
end
