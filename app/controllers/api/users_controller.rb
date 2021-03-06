class Api::UsersController < ApplicationController
  skip_before_action :require_login, only: %i[create]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def destroy
    current_user.destroy!
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
