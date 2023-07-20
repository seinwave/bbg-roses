# frozen_string_literal: true

class CreateRoses < ActiveRecord::Migration[7.0]
  def change
    create_table :roses do |t|
      t.text :name
      t.text :primary_color
      t.text :accent_color
      t.float :location_x
      t.float :location_y
      t.date :acquired_date
      t.boolean :is_deleted

      t.timestamps
    end
    add_index :roses, :name, unique: true
  end

  def down
    drop_table :roses
  end
end
