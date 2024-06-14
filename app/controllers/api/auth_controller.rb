class Api::AuthController < ApplicationController
  include ActionController::HttpAuthentication::Token

  before_action :authenticate, except: [:login, :index, :show]

  def login
    @user = User.find_by(email: permitted_params[:email])

    if @user.present? && @user.password == permitted_params[:password]
      @token = @user.api_tokens.create
      render json: { bearer_token: @token.token }, status: 200
    else
      render json: { error: "Invalid email or password" }, status: 401
    end
  end

  private

  def authenticate
    token, _options = token_and_options(request)

    if token.nil?
      render json: { message: "No Bearer token provided" }, status: 401
      return
    end

    @token = ApiToken.find_by(token: token)

    if @token.nil?
      render json: { message: "Invalid Bearer token provided" }, status: 401
      return
    end

  end

  def permitted_params
    params.permit(:email, :password)
  end
end