class CreateApiKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :api_keys do |t|
      t.string :access_token, null: false, unique: true
      t.datetime :expires_at
      t.references :user, foreign_key: true

      t.timestamps
      t.index ["access_token"], unique: true
    end
  end
end
