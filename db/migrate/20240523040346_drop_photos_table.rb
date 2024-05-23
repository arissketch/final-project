class DropPhotosTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :photos

  end
end
