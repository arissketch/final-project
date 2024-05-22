class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :image_address
      t.integer :user_id
      t.integer :bathroom_id

      t.timestamps
    end
  end
end
