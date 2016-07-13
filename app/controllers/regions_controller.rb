class RegionsController < ApplicationController

  def index
    @regions = Region.where(country_id: params[:country_id])
  end
end
