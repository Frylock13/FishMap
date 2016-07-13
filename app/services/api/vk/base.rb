module Api
  module Vk
    class Base
      
      attr_reader :client, :per_page

      def initialize(per_page=0)
        @client = VkontakteApi::Client.new
        @per_page = per_page
      end
    end
  end
end