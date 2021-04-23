require 'rails_helper'

RSpec.describe "Pomodoros", type: :request do
  describe "GET /api/pomodoro/pomodoro_count" do
    let!(:user) { create(:user) }
    before do
      sign_in(user)
    end

    it '200が返ってくる' do
      get '/api/pomodoro/pomodoro_count'
      expect(response.status).to eq 200
    end
  end
  describe "POST /api/pomodoro" do
    let!(:user) { create(:user) }
    let!(:task) { create(:task)}
    before do
      sign_in(user)
    end

    it '200が返ってくる' do
      post '/api/pomodoro', params: { pomodoro: { user_id: user.id, task_id: task.id } }
      expect(response.status).to eq 200
    end
  end

end
