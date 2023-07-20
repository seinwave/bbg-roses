# frozen_string_literal: true

class RemoveColumnsFromPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :primary_color, :text
    remove_column :plants, :accent_color, :text
    remove_column :plants, :acquired_date, :date
    remove_column :plants, :species_id, :integer
    remove_column :plants, :name, :text
  end
end
