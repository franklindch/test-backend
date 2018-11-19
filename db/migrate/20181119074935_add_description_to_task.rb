class AddDescriptionToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :description, :text
    change_column :comments, :description, :text
  end
end
