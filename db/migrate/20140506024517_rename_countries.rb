class RenameCountries < ActiveRecord::Migration
  def change
    rename_table :countries, :teams
  end
end
