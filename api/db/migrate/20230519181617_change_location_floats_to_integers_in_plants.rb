class ChangeLocationFloatsToIntegersInPlants < ActiveRecord::Migration[7.0]
  def change
    change_column :plants, :location_x, :integer
    change_column :plants, :location_y, :integer
  end
end
