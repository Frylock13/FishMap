class MapController < ApplicationController

  def index
    get_current_coordinates
  end
end
