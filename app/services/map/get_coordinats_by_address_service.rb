module Map
  class GetCoordinatsByAddressService

    attr_reader :hash_result

    def initialize(address)
      @hash_result = Geocoder.search(address)
    end

    def call
      result = GeoLocation.new(latitude, longitude)
    end

    private

    GeoLocation = Struct.new(:latitude, :longitude) do
    end

    def latitude
      hash_result[0].data["geometry"]["location"]["lat"]
    end

    def longitude
      hash_result[0].data["geometry"]["location"]["lng"]
    end
  end
end