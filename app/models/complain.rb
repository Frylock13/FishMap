class Complain < ActiveRecord::Base
  
  belongs_to :complainable, polymorphic: true

  validates :complainable_id, uniqueness: { scope: :complainable_type }

  scope :places, -> { where(complainable_type: 'Place') }
  scope :reviews, -> { where(complainable_type: 'Review') }
end
