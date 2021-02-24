class Task < ApplicationRecord
  validates :title, presence: true
  validates :deadline, presence: true

  belongs_to :user
  enum status: { todo: 0, done: 1 }
end
