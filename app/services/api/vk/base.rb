module Api
  module Vk
    class Base
      
      attr_reader :client

      def initialize
        @client = VkontakteApi::Client.new
      end
    end
  end
end