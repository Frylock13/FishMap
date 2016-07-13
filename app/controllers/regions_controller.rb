class RegionsController < ApplicationController

  def index
    @regions = Region.where(country_id: params[:country_id])
    country = Country.find(params[:country_id])
    @coordinates = Map::GetCoordinatsByAddressService.new(country.name).call
  end
end
