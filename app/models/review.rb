class Review < ActiveRecord::Base
  
  belongs_to :place, counter_cache: true

  has_many :complains, as: :complainable, dependent: :destroy

  validates :name, :review, presence: true
end
