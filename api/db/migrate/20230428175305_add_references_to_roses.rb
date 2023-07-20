# frozen_string_literal: true

class AddReferencesToRoses < ActiveRecord::Migration[7.0]
  def change
    add_column :roses, :user_id, :integer
    add_foreign_key :roses, :users
    add_column :roses, :variety_id, :integer
    add_foreign_key :roses, :varieties
    add_column :roses, :species_id, :integer
  end
end
