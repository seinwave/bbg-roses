# frozen_string_literal: true

class RemoveUnnecessaryColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :user_id
    remove_column :plants, :variety_id
    remove_column :species, :bred_date
    remove_column :species, :breeder
    remove_column :species, :introduced_date
  end
end
