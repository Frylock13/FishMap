class Country < ActiveRecord::Base

  has_many :regions, dependent: :destroy
  has_many :cities, dependent: :destroy
end
