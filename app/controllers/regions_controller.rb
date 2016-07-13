class RegionsController < ApplicationController

  def index
    service = Api::Vk::RegionsGetService.new(params[:country_id])
    @regions = service.call
  end
end
