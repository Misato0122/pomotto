class Api::SessionsController < ApplicationController
  skip_before_action :authenticate
  def create
    @user = login(params[:email], params[:password])

    raise ActiveRecord::RecordNotFound unless @user

    set_access_token!(@user)
    render json: @user

  end

  def destroy
    logout
  end

  private

  def form_authenticity_token; end
end
