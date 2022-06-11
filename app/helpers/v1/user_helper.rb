module V1::UserHelper
  def location_valid?(location)
    Geocoder.search(location)&.first&.coordinates
  end

  def today_birthday
    User.where('EXTRACT(MONTH FROM birthday_date) = ?', Date.today.month)
        .where('EXTRACT(DAY FROM birthday_date) = ?', Date.today.day)
  end
end
