class CountriesController < ApplicationController
  
  def index
    service = Api::Vk::CountriesGetService.new
    @countries = service.call
  end
end
