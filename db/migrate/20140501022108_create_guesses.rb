class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :user_id
      t.integer :match_id
      t.integer :goals_a
      t.integer :goals_b
      t.timestamps
    end

    add_index :guesses, :match_id
    add_index :guesses, :user_id
    add_index :guesses, [:id, :user_id]
  end
end
