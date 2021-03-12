class Api::UsersController < ApplicationController
  skip_before_action :require_login

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :bad_request
    end
  end

  # def guest_login
  #   guest_user = User.find_by!(role: 'guest')
  #   auto_login(guest_user)
  #   render json: guest_user
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
