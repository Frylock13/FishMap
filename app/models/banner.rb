class Banner < ActiveRecord::Base

  scope :active, -> { where(active: true) }
end
