class AddScoreToUser < ActiveRecord::Migration
  def change
    add_column :users, :score, :integer, default: 0, after: :email
  end
end
