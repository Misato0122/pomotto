require 'rails_helper'

RSpec.describe User, type: :model do
  it '全ての属性が有効な時検証が通る' do
    user = build(:user)
    expect(user).to be_valid
  end
  it '名前がないとユーザー作成できない' do
    user = build(:user, name: "")
    expect(user).to be_invalid
  end
  it 'メールアドレスがないとユーザー作成できない' do
    user = build(:user, email: "")
    expect(user).to be_invalid
  end
  it 'パスワードがないととユーザー作成できない' do
    user = build(:user, password: "")
    expect(user).to be_invalid
  end
  it 'パスワードとパスワード確認が一致していないととユーザー作成できない' do
    user = build(:user, password: "password", password_confirmation: "hogege")
    expect(user).to be_invalid
  end
end
