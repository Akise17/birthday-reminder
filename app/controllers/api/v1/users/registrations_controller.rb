class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    sign_up(:user, resource) if resource.save

    return register_failed if resource.errors.any?

    register_success
  end

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    render json: { message: 'Signed up.' }
  end

  def register_failed
    render json: { message: 'Signed up failure.' }
  end

  def user_params
    params.permit(:email, :username, :first_name, :last_name, :birthday_date)
  end
end
