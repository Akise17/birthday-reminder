class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery unless: -> { request.format.json? }

  def res(code, message, data = nil)
    render json: Res.call(code, message, data), status: code
  end
end
