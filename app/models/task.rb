class Task < ApplicationRecord
  validates :title, presence: true
  validates :deadline, presence: true

  belongs_to :user
  has_many :pomodoros, dependent: :nullify
  enum status: { todo: 0, done: 1 }
end
