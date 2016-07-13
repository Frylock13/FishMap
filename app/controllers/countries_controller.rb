class CountriesController < ApplicationController
  def index
    @vk = VkontakteApi::Client.new
    @countries = @vk.database.getCities(country_id: 1, need_all: 1)
  end

  def show
  end
end
