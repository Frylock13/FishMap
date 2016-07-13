class MapController < ApplicationController

  def index
    @latitude  = request.location.latitude
    @longitude = request.location.longitude
  end
end
