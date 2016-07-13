class RegionsController < ApplicationController

  def index
    service = Api::Vk::Regions::ListGetService.new(params[:country_id])
    @regions = service.call
  end
end
