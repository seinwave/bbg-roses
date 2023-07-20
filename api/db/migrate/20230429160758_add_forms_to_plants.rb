# frozen_string_literal: true

class AddFormsToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :form, :integer, null: false, default: 0
  end
end
