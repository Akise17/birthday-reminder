module V1::UserHelper
  def location_valid?(location)
    Geocoder.search(location)&.first&.coordinates
  end
end
