class AddActiveToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :active, :boolean, after: :name, default: true
    add_index :groups, :active
  end
end
