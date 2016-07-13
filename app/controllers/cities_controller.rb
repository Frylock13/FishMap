class CitiesController < ApplicationController

  def index
    @cities = City.where('country_id = ? AND region_id = ?', params[:country_id], params[:region_id])
    region = Region.find(params[:region_id])
    @coordinates = Map::GetCoordinatsByAddressService.new(region.name).call
  end

  def show
    @city = City.find(params[:id])
    @coordinates = Map::GetCoordinatsByAddressService.new(@city.name).call
  end
end
