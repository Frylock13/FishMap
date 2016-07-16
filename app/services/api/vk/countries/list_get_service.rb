module Api
  module Vk
    module Countries
      class ListGetService < Api::Vk::Base

        def initialize(per_page=0)
          super(per_page)
        end

        def call
          @client.database.getCountries(offset: per_page)
        end
      end
    end
  end
end