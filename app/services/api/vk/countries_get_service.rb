module Api
  module Vk
    class CountriesGetService < Api::Vk::Base

      def initialize
        super
      end

      def call
        @client.database.getCountries
      end
    end
  end
end