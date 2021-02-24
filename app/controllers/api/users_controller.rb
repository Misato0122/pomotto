class Api::UsersController < ApplicationController
  skip_before_action :require_login
  before_action :set_user, only: %i[update destroy]
  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def update

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
