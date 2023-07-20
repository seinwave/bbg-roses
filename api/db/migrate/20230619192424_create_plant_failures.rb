class CreatePlantFailures < ActiveRecord::Migration[7.0]
  def change
    create_table :plant_failures do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.bigint :sector_id
      t.timestamps
    end
  end
end
