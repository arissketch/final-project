class AddPhotosToRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :photo, :string 

  end
end
