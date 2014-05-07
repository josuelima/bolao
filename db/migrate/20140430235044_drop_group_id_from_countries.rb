class DropGroupIdFromCountries < ActiveRecord::Migration
  def change    
    remove_column :countries, :group_id
    add_column    :countries, :active, :boolean, after: :slug

    add_index :countries, :active
  end
end
