class AddPositionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :position, :integer, after: :admin
  end
end
