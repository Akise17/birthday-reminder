class V1::UserController < ApplicationController
  include V1::UserHelper

  before_action :authenticate_admin!
  before_action :validate, only: %i[create update]

  def create
    user = User.new(user_params)
    return res(422, 'User creation failed', user.errors.full_messages) unless user.save

    res(201, 'User creation success', user)
  end

  def update
    user = User[params[:id]]
    return res(422, 'User update failed', user.errors.full_messages) unless user.update(user_params)

    res(200, 'User update success', user)
  end

  def destroy
    user = User[params[:id]]
    return res(422, 'User deletion failed', user.errors.full_messages) unless user.destroy

    res(200, 'User deletion success')
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday_date, :location)
  end

  def validate
    return res(422, 'Location not found') unless location_valid?(params[:location])
  end
end
