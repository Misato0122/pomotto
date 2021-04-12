class Api::SessionsController < ApplicationController
  skip_before_action :require_login
  def create
    @user = login(params[:email], params[:password])
    raise ActiveRecord::RecordNotFound unless @user

    render json: @user
  end

  def destroy
    logout
    redirect_to home: :index
  end

  def guest_login
    guest_user = User.find_by!(role: 'guest')
    auto_login(guest_user)
    render json: guest_user
   end
end
