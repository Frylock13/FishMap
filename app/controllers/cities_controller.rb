class CitiesController < ApplicationController

  def index
    @cities = City.where('country_id = ? AND region_id = ?', params[:country_id], params[:region_id]).order(:name)
    region = Region.find(params[:region_id])
    @coordinates = Map::GetCoordinatsByAddressService.new(region.name).call
  end

  def show
    @city = City.find(params[:id])
    @coordinates = Map::GetCoordinatsByAddressService.new(@city.name).call
    @markers = [['Bondi Beach', -33.890542, 151.274856],['Coogee Beach', -33.923036, 151.259052],['Cronulla Beach', -34.028249, 151.157507],['Manly Beach', -33.80010128657071, 151.28747820854187],['Maroubra Beach', -33.950198, 151.259302]]
  end
end
