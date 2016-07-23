class MapController < ApplicationController

  def index
    @categories = Category.all
    get_current_coordinates
  end
end
