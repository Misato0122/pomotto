require 'rails_helper'

RSpec.describe Pomodoro, type: :model do
  let!(:user) { create(:user) }
  let!(:task) { create(:task) }
  let!(:pomodoro) { create(:pomodoro) }
  
  it '全ての属性が有効な時検証が通る' do
    expect(pomodoro).to be_valid
  end
  it '該当するユーザーがいないとタスク作成できない' do
    pomodoro_without_user = build(:pomodoro, user_id: nil)
    expect(pomodoro_without_user).to be_invalid
  end
end
