class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'Successfully created user' }, status: :created
    else
      render json: { message: user.errors.full_messages * ' ' },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :password)
  end
end
