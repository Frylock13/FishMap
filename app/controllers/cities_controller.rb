class CitiesController < ApplicationController

  def index
    service = Api::Vk::Cities::ListGetService.new(params[:country_id], params[:region_id])
    @cities = service.call
  end
end
