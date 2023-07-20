# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rose, null: false, foreign_key: true
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
