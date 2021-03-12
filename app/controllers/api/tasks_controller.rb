class Api::TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy, :pomodoro_count]
  def index
    @tasks = current_user.tasks.all
    render json: @tasks
  end

  def show
    render json: @task
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task
    else
      render json: @task.errors, status: :bad_request
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :bad_request
    end
  end

  def destroy
    @task.destroy
    render json: @task
  end

  def pomodoro_count
    fetch_pomodoro = []
    d = Time.zone.today
    pomodoro = @task.pomodoros.group("date(created_at)").count
    (0..6).each do |a|
      fetch_pomodoro.push({day: d - a, count: pomodoro[d - a]})
    end

    render json: fetch_pomodoro
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status).merge(user_id: current_user.id)
  end
end
