class ChangeLocationTypesToFloats < ActiveRecord::Migration[7.0]
  def change
    change_column :plants, :location_x, :float
    change_column :plants, :location_y, :float
  end
end
