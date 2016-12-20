class AddGithubThingsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar_url, :string
    add_column :users, :github_username, :string
  end
end
