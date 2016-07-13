module Api
  module Vk
    class RegionsGetService < Api::Vk::Base

      attr_reader :country_id

      def initialize(country_id)
        super()
        @country_id = country_id
      end

      def call
        @client.database.getRegions(country_id: country_id)
      end
    end
  end
end