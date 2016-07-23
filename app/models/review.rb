class Review < ActiveRecord::Base
  
  belongs_to :place, counter_cache: true

  validates :name, :review, presence: true
end
