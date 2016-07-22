class Review < ActiveRecord::Base
  
  belongs_to :place

  validates :name, :review, presence: true
end
