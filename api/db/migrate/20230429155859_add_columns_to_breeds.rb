# frozen_string_literal: true

class AddColumnsToBreeds < ActiveRecord::Migration[7.0]
  def change
    add_column :breeds, :description, :string
    add_column :breeds, :is_deleted, :boolean, default: false, null: false
  end
end
