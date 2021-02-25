class Api::PomodorosController < ApplicationController
  def create
    @pomodoro = Pomodoro.new(pomodoro_params)
    @pomodoro.save
    render json: @pomodoro
  end

  private

  def pomodoro_params
    params.require(:pomodoro).permit(:task_id).merge(user_id: current_user.id)
  end
end
