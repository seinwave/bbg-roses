class AddSectorToPlantModel < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :sector, :string
  end
end
