class CitiesController < ApplicationController

  def index
    @cities = City.where('country_id = ? AND region_id = ?', params[:country_id], params[:region_id])
  end
end
