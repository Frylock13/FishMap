class Page < ActiveRecord::Base

  validates :slug, :title, :body, uniqueness: true
  validates :slug, :title, :body, presence: true

  scope :active, -> { where(active: true) }


end
