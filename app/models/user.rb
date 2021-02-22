class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  has_many :api_keys, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def activate_api_key!
    return api_keys.active.first if api_keys.active.exists?

    api_keys.create
  end
end
