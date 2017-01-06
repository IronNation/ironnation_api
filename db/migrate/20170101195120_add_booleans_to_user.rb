class AddBooleansToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mentor, :boolean, default: false, null: false
    add_column :users, :judge, :boolean, default: false, null: false
  end
end
