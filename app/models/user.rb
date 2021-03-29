class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  enum role: { general: 0, guest: 1, admin: 2 }

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  
  has_many :tasks, dependent: :nullify
  has_many :pomodoros, dependent: :nullify
end
