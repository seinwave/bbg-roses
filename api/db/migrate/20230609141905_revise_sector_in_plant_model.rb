class ReviseSectorInPlantModel < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :sector, :string
    add_reference :plants, :sector, null: false, foreign_key: true
  end
end
