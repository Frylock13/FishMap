module Api
  module Vk
    module Cities
      class ListGetService < Api::Vk::Base

        attr_reader :country_id, :region_id

        def initialize(country_id, region_id, per_page=0)
          super(per_page)
          @country_id = country_id
          @region_id = region_id
        end

        def call
          @client.database.getCities(country_id: country_id, region_id: region_id, offset: per_page)
        end
      end
    end
  end
end