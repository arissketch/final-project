class AddOverallToRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :overall, :integer  end
end
