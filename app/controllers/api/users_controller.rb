class Api::UsersController < ApplicationController
  include ApiAuthentication
  skip_before_action :verify_authenticity_token

  def show
    @user = api_user
    render json: { id: @user.id, email: @user.email, name: @user.name, balance: @user.balance }
  end
end
