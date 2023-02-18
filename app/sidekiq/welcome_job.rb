class WelcomeJob
  include Sidekiq::Job

  def perform(user_id)
    user = User.find(user_id)
    return if user.nil?

    UserMailer.with(user: user).welcome_email.deliver_later
  end
end
