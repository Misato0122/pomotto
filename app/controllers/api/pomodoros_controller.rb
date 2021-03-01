class Api::PomodorosController < ApplicationController
  def create
    @pomodoro = Pomodoro.new(pomodoro_params)
    @pomodoro.save
    render json: @pomodoro
  end

  def pomodoro_count
    pomodoros = []
    d = Time.zone.today
    pomodoro = current_user.pomodoros.group("date(created_at)").count
    (0..6).each do |a|
      pomodoros.push({day: d - a, count: pomodoro[d - a]})
    end

    render json: pomodoros
  end

  private

  def pomodoro_params
    params.require(:pomodoro).permit(:task_id).merge(user_id: current_user.id)
  end
end
