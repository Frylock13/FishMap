class Review < ActiveRecord::Base
  
  belongs_to :place, counter_cache: true
  belongs_to :user

  has_many :complains, as: :complainable, dependent: :destroy

  validates :name, presence: true
end
