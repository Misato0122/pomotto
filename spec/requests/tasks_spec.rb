require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let!(:user) { create(:user) }
  let!(:task) { create(:task) }
  before do
    sign_in(user)  
  end

  describe "GET /api/tasks" do
    it 'タスク取得できる' do
      get "/api/tasks"
      expect(response.status).to eq(200)
    end
  end

  describe "POST /api/tasks" do
    it 'タスク作成できる' do
      post '/api/tasks', params: { task: { title: "hgoehoge", content: "hogehoge", status: "todo", deadline: Time.now } }
      expect(response.status).to eq(200)
    end
  end

end
