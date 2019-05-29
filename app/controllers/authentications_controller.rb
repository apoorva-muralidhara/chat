class AuthenticationsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])

    if user and user.authenticate(params[:password])
      render json: { auth_token: user.auth_token }, status: :created
    else
      render json: { message: 'Authentication Failed'}, status: :unauthorized
    end
  end
end
