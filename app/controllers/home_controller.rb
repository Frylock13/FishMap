class HomeController < ApplicationController
  def index
    @vk = VkontakteApi::Client.new
    @countries = @vk.database.getCities(country_id: 1, need_all: 1)
    #@countries = @vk.database.getCountries
  end
end
