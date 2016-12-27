class AddFieldsToMentor < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :github_username, :string
    add_column :mentors, :avatar, :string
  end
end
