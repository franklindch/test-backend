class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :status
      t.integer :priority
      t.date :deadline

      t.timestamps
    end
  end
end
