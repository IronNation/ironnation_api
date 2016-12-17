class AddSchoolToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :school_id, :integer
  end
end
