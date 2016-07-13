json.array!(@places) do |place|
  json.extract! place, :id, :title, :category_id, :address_id, :description, :visits, :user_id, :latitude, :longitude
  json.url place_url(place, format: :json)
end
