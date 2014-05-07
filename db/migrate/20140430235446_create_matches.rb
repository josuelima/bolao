class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :datetime
      t.integer  :team_a
      t.integer  :team_b
      t.integer  :goals_a
      t.integer  :goals_b
      t.integer  :group_id
      t.timestamps
    end

    add_index :matches, :group_id
    add_index :matches, :team_a
    add_index :matches, :team_b
  end
end