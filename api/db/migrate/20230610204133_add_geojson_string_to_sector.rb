class AddGeojsonStringToSector < ActiveRecord::Migration[7.0]
  def change
    add_column :sectors, :geojson_string, :string, null: false
  end
end
