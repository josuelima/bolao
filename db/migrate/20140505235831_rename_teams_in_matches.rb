class RenameTeamsInMatches < ActiveRecord::Migration
  def change
    rename_column :matches, :team_a, :team_a_id
    rename_column :matches, :team_b, :team_b_id
  end
end
