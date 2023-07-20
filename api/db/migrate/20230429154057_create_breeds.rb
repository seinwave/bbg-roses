# frozen_string_literal: true

class CreateBreeds < ActiveRecord::Migration[7.0]
  def change
    create_table :breeds do |t|
      t.string :name, null: false
      t.string :breeder
      t.string :primary_color
      t.string :accent_color
      t.date :bred_date
      t.date :introduced_date
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
