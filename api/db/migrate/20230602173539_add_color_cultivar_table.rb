class AddColorCultivarTable < ActiveRecord::Migration[7.0]
  def change
    create_table :cultivar_colors do |t|
       t.references :cultivar, null: false, foreign_key: true
       t.string :primary_color
       t.string :accent_color
       t.timestamps
    end
  end
end
