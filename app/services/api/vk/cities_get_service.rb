module Api
  module Vk
    class CitiesGetService < Api::Vk::Base

      attr_reader :country_id, :region_id

      def initialize(country_id, region_id)
        super()
        @country_id = country_id
        @region_id = region_id
      end

      def call
        @client.database.getCities(country_id: country_id, region_id: region_id, offset: 100)
      end
    end
  end
end