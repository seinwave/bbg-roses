# frozen_string_literal: true

class CreateScentRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :scent_ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rose, null: false, foreign_key: true
      t.integer :rating, null: false, default: 1
      t.check_constraint 'rating >= 1 AND rating <= 5'

      t.timestamps
    end
  end
end
