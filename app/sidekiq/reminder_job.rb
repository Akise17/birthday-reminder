require 'sidekiq-scheduler'

class ReminderJob
  include Sidekiq::Worker
  def perform
    users = User.where('EXTRACT(MONTH FROM birthday_date) = ?', DateTime.now.month)
                .where('EXTRACT(DAY FROM birthday_date) = ?', DateTime.now.day)
    users.each do |user|
      UserMailer.with(user:).happy_birthday.deliver_later
    end
  end
end
