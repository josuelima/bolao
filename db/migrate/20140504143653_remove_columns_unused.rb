class RemoveColumnsUnused < ActiveRecord::Migration
  def change
    remove_column :countries, :active
  end
end
