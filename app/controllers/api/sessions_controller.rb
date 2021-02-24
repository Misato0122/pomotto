class Api::SessionsController < ApplicationController
  skip_before_action :require_login
  def create
    @user = login(params[:email], params[:password])
    raise ActiveRecord::RecordNotFound unless @user

    render json: @user

  end

  def destroy
    logout
  end
end
