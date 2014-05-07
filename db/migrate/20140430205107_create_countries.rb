class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :slug
      t.column :group, "char(1)"
      t.timestamps
    end

    add_index :countries, :slug
    add_index :countries, :group
  end
end