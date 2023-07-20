# frozen_string_literal: true

class CreateSpecies < ActiveRecord::Migration[7.0]
  def change
    create_table :species do |t|
      t.string :latin_name
      t.string :common_name
      t.string :breeder
      t.date :bred_date
      t.date :introduced_date

      t.timestamps
    end
  end
end
