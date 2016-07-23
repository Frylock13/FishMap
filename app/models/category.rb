class Category < ActiveRecord::Base
  
  has_many :places

  validates :name, :slug, presence: true
end
