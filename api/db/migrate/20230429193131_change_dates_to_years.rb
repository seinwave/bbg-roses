# frozen_string_literal: true

class ChangeDatesToYears < ActiveRecord::Migration[7.0]
  def change
    remove_column :breeds, :bred_date, :date
    remove_column :breeds, :introduced_date, :date
    add_column :breeds, :bred_year, :integer
    add_column :breeds, :introduced_year, :integer
  end
end
