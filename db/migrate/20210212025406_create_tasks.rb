class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content
      t.integer :status, null: false, default: 0
      t.date :deadline, null: false

      t.timestamps
    end
  end
end
