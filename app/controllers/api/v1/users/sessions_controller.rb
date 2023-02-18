class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json
  attr_reader :resource

  def create
    @resource = User.find_by!(email: login_params[:email])
    @resource.errors.add(:base, 'Wrong Password') unless @resource.try(:valid_password?, login_params[:password])
    return log_in_error unless @resource.errors.blank?

    sign_in(:user, @resource)
    log_in_success
  end

  private

  def log_in_success
    render json: { message: 'Logged.' }, status: :ok
  end

  def log_in_error
    render json: { message: 'Unauthorized' }, status: :unauthorized
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end

  def log_out_success
    render json: { message: 'Logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Logged out failure.' }, status: :unauthorized
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
