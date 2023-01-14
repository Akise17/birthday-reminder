class UsersController < ApplicationController
  def create
    # Create new user object
    user = User.new(user_params)

    # return when record not saved
    unless user.save
      return render json: { message: user.errors.full_messages },
                    status: :unprocessable_entity
    end

    # response if successfuly save
    render json: { message: 'Create Success',
                   user: }
  end

  def update
    # find user by id
    user = User.find(params[:id])

    # return when record not saved
    unless user.update(user_params)
      return render json: { message: user.errors.full_messages },
                    status: :unprocessable_entity
    end

    # response if successfuly save
    render json: { message: 'Update Success',
                   user: }
  end

  def index
    # return all user
    render json: User.all
  end

  def show
    # find user by id
    user = User.find(params[:id])

    # return user
    render json: user
  end

  def destroy
    # find user by id
    user = User.find(params[:id])

    # return when record not destroyed
    unless user.destroy
      return render json: { message: user.errors.full_messages },
                    status: :unprocessable_entity
    end

    # response if successfuly save
    render json: { message: 'Destroy Success',
                   user: }
  end

  private

  # set up strong parameter
  def user_params
    params.permit(:username, :first_name, :last_name, :birthday_date)
  end
end
