class Api::ProfilesController < ApplicationController
  before_action :set_user
  def show
    render json: @user
  end

  def update
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
