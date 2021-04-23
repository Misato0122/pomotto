require 'rails_helper'

RSpec.describe "UserSessions", type: :request do
  describe 'POST /api/session' do
    let!(:user) { create(:user) }
    before { post '/api/session', params: { email: user.email, password: "password" } }
      it 'ログインできている' do
        expect(current_user).to eq user
      end

      it 'ログアウトできている' do
        delete '/api/session'
        expect(current_user).to eq nil
      end
  end

  describe 'POST /api/session/guest_login' do
    let!(:guest) { create(:user, role: "guest")}
    before { post '/api/session/guest_login' }
    it 'ゲストユーザーとしてログインする' do
      expect(current_user).to eq guest
    end
  end
end
