class AddUidToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :uid, :string
  end
end
