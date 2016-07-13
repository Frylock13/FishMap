class Place < ActiveRecord::Base

  belongs_to :category
  belongs_to :city

  geocoded_by :address   # can also be an IP address
  after_validation :geocode
end
