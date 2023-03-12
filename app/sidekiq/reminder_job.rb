require 'sidekiq-scheduler'

class ReminderJob
  include Sidekiq::Worker
  def perform
    users = User.where('EXTRACT(MONTH FROM birthday_date) = ?', DateTime.now.month)
                .where('EXTRACT(DAY FROM birthday_date) = ?', DateTime.now.day)
    users.each do |user|
      RequestBin.send_webhook(user.id)
      sleep 0.1
    end
  end
end
