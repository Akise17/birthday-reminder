require 'sidekiq-scheduler'
require 'timezone_finder'

class Birthday::ReminderJob
  include Sidekiq::Worker
  include V1::UserHelper

  def perform
    users = today_birthday
    return unless users

    tf = TimezoneFinder.create
    users.each do |user|
      coordinates = Geocoder.search("#{user.location}, #{user.country}")&.first&.coordinates
      Time.zone = tf.closest_timezone_at(lng: coordinates.last, lat: coordinates.first)
      current_time = Time.now.in_time_zone
      if current_time.hour == Setting['REMINDER_TIME'].to_i
        Birthday::HookbinJob.perform_async(user.message)
      end
    end
  end
end
