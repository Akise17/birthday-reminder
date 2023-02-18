class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound do |e|
    data = { message: e.message }
    render json: data, status: :not_found
  end

  protected

  def authenticate_user!
    return render json: { message: 'Unauthorized' }, status: :unauthorized unless user_signed_in?

    super
  end
end
