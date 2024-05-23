class RemoveCommentIdFromRatings < ActiveRecord::Migration[7.0]
  def change
    remove_column :ratings, :comment_id
    remove_column :ratings, :latitude


  end
end
