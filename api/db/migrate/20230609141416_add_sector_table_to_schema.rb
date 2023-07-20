class AddSectorTableToSchema < ActiveRecord::Migration[7.0]
  def change
    create_table :sectors, force: :cascade do |t|
      t.string :name, null: false
      t.jsonb :coordinates, null: false
      t.timestamps
    end
  end
end
