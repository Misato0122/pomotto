require 'rails_helper'

RSpec.describe Task, type: :model do
  it '全ての属性が有効な時検証が通る' do
    task = build(:task)
    expect(task).to be_valid
  end
  it '見出しがないままでタスク作成できない' do
    task_without_title = build(:task, title: "")
    expect(task_without_title).to be_invalid
  end
  it '締め切り日がないままでタスク作成できない' do
    task_without_deadline = build(:task, deadline: nil)
    expect(task_without_deadline).to be_invalid
  end
  it 'ステータスがないままでタスク作成できない' do
    task_without_status = build(:task, status: nil)
    expect(task_without_status).to be_invalid
  end
end
