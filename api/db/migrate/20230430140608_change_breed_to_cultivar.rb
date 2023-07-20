# frozen_string_literal: true

class ChangeBreedToCultivar < ActiveRecord::Migration[7.0]
  def change
    add_reference :plants, :cultivar, null: false, foreign_key: true
  end
end
