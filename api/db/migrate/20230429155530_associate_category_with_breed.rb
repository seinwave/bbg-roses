# frozen_string_literal: true

class AssociateCategoryWithBreed < ActiveRecord::Migration[7.0]
  def change
    add_reference :breeds, :category, null: false, foreign_key: true
  end
end
