class ChangeCountriesGroup < ActiveRecord::Migration
  def change
    remove_column :countries, :group
    add_column    :countries, :group_id, :integer, after: :slug
    add_index     :countries, :group_id
  end
end
