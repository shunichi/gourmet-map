module RestaurantsHelper
  def restaurants_to_data(restaurants)
    restaurants.map do |r|
        { name: r.name, latitude: r.latitude, longitude: r.longitude, url: restaurant_path(r) }
    end.to_json
  end
end
