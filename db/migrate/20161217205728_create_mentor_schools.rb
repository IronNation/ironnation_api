class CreateMentorSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :mentor_schools do |t|
      t.references :mentor, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
