class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def happy_birthday
    @user = params[:user]
    mail(to: @user.email,
         subject: "Happy Birthday #{@user.first_name} #{@user.last_name}")
  end
end
