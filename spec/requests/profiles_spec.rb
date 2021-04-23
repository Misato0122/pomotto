require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  describe "GET /api/profile" do
    let!(:user) { create(:user) }
    before do
      post '/api/session', params: { email: user.email, password: "password" }
      get '/api/profile'
      @json = JSON.parse(response.body)
    end

    it '200が返ってくる' do
      expect(response.status).to eq 200
    end

    it 'nameが正確に取得される' do
      expect(@json["name"]).to eq user.name
    end

    it 'emailが正確に取得される' do
      expect(@json["email"]).to eq user.email
    end
  end
end
