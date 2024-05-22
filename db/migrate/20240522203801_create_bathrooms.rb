class CreateBathrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :bathrooms do |t|
      t.string :address
      t.integer :comment_id
      t.boolean :open_to_public

      t.timestamps
    end
  end
end
