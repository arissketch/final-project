class AddNameToBathrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :bathrooms, :name, :string
  end
end
