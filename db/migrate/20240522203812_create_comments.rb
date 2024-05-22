class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :comments
      t.integer :bathroom_id

      t.timestamps
    end
  end
end
