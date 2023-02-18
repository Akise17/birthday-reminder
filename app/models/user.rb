class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtUserDenylist

  after_create :send_welcome_email

  def send_welcome_email
    WelcomeJob.perform_in(1.minutes, id)
  end
end
