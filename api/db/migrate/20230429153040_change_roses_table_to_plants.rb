# frozen_string_literal: true

class ChangeRosesTableToPlants < ActiveRecord::Migration[7.0]
  def change
    rename_table :roses, :plants
  end
end
