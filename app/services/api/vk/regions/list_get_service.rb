module Api
  module Vk
    module Regions
      class ListGetService < Api::Vk::Base

        attr_reader :country_id

        def initialize(country_id, per_page=0)
          super(per_page)
          @country_id = country_id
        end

        def call
          @client.database.getRegions(country_id: country_id, offset: per_page)
        end
      end
    end
  end
end