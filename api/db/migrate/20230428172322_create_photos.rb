# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rose, null: false, foreign_key: true
      t.string :photo_url

      t.timestamps
    end
  end
end
