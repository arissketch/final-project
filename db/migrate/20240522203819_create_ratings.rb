class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :comment_id
      t.integer :user_id
      t.integer :cleaniness
      t.integer :safety
      t.integer :bathroom_id
      t.integer :environment

      t.timestamps
    end
  end
end
