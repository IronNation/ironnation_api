class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :city, :string
    add_column :teams, :project_name, :string
    add_column :teams, :project_url, :string

  end
end
