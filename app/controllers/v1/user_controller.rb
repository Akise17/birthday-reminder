class V1::UserController < ApplicationController
  before_action :authenticate_admin!

  def index
    render json: {
      message: "test API"
    }
  end
  
end
