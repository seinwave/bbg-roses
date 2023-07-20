class ChangeLocationNamesToLatLong < ActiveRecord::Migration[7.0]
  def change
    rename_column :plants, :location_x, :latitude
    rename_column :plants, :location_y, :longitude
  end
end
