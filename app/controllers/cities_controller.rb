class CitiesController < ApplicationController

  def index
    service = Api::Vk::CitiesGetService.new(params[:country_id], params[:region_id])
    @cities = service.call
  end
end
