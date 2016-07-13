class MapController < ApplicationController

  def index
    @longitude = request.location.longitude
    @latitude  = request.location.latitude
  end
end
