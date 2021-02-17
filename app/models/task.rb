class Task < ApplicationRecord
  validates :title, presence: true
  validates :deadline, presence: true
  enum status: { todo: 0, done: 1 }
end
