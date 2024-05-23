class ChangeOverallInRatings < ActiveRecord::Migration[7.0]
  def change
    change_column :ratings, :overall, :float
  end
end
